package plugin

import (
	"context"
	"fmt"

	plugintypes "github.com/loft-sh/vcluster/pkg/plugin/types"
	pluginv1 "github.com/loft-sh/vcluster/pkg/plugin/v1"
	pluginv2 "github.com/loft-sh/vcluster/pkg/plugin/v2"
	"github.com/loft-sh/vcluster/pkg/setup/options"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/client-go/rest"
	clientcmdapi "k8s.io/client-go/tools/clientcmd/api"
	"sigs.k8s.io/controller-runtime/pkg/client"
)

var DefaultManager = newManager()

func newManager() plugintypes.Manager {
	return &manager{
		legacyManager: pluginv1.NewManager(),
		pluginManager: pluginv2.NewManager(),
	}
}

type manager struct {
	legacyManager *pluginv1.Manager
	pluginManager *pluginv2.Manager
}

func (m *manager) Start(
	ctx context.Context,
	currentNamespace, targetNamespace string,
	virtualKubeConfig *rest.Config,
	physicalKubeConfig *rest.Config,
	syncerConfig *clientcmdapi.Config,
	options *options.VirtualClusterOptions,
) error {
	err := m.legacyManager.Start(ctx, currentNamespace, targetNamespace, virtualKubeConfig, physicalKubeConfig, syncerConfig, options)
	if err != nil {
		return fmt.Errorf("start legacy plugins: %w", err)
	}

	err = m.pluginManager.Start(ctx, currentNamespace, physicalKubeConfig, syncerConfig, options)
	if err != nil {
		return fmt.Errorf("start plugins: %w", err)
	}

	return nil
}

func (m *manager) SetLeader(ctx context.Context) error {
	m.legacyManager.SetLeader(true)
	return m.pluginManager.SetLeader(ctx)
}

func (m *manager) MutateObject(ctx context.Context, obj client.Object, hookType string, scheme *runtime.Scheme) error {
	err := m.legacyManager.MutateObject(ctx, obj, hookType, scheme)
	if err != nil {
		return err
	}

	err = m.pluginManager.MutateObject(ctx, obj, hookType, scheme)
	if err != nil {
		return err
	}

	return nil
}

func (m *manager) HasClientHooks() bool {
	return m.legacyManager.HasClientHooks() || m.pluginManager.HasClientHooks()
}

func (m *manager) HasClientHooksForType(versionKindType plugintypes.VersionKindType) bool {
	return m.legacyManager.HasClientHooksForType(versionKindType) || m.pluginManager.HasClientHooksForType(versionKindType)
}

func (m *manager) HasPlugins() bool {
	return m.legacyManager.HasPlugins() || m.pluginManager.HasPlugins()
}
