{{/*
  handles both replicas and syncer.replicas
*/}}
{{- define "vcluster.replicas" -}}
{{ if .Values.replicas }}{{ .Values.replicas }}{{ else }}{{ .Values.syncer.replicas }}{{ end }}
{{- end }}

{{/*
  handles both vcluster and api image
*/}}
{{- define "vcluster.apiimage" -}}
{{ if .Values.vcluster.image }}{{ .Values.vcluster.image }}{{ else }}{{ .Values.api.image }}{{ end }}
{{- end }}

{{/*
  handles both vcluster and api command
*/}}
{{- define "vcluster.apicommand" -}}
{{ if .Values.vcluster.command }}{{ .Values.vcluster.command }}{{ else }}{{ .Values.api.command }}{{ end }}
{{- end }}

{{/*
  handles both vcluster and api args
*/}}
{{- define "vcluster.apiargs" -}}
{{ if .Values.vcluster.baseArgs }}{{ .Values.vcluster.baseArgs }}{{ else }}{{ .Values.api.baseArgs }}{{ end }}
{{- end }}

{{/*
  handles both vcluster and api extra args
*/}}
{{- define "vcluster.apiargs" -}}
{{ if .Values.vcluster.extraArgs }}{{ .Values.vcluster.extraArgs }}{{ else }}{{ .Values.api.extraArgs }}{{ end }}
{{- end }}

{{/*
  handles both vcluster and api imagePullPolicy
*/}}
{{- define "vcluster.apipullpolicy" -}}
{{ if .Values.vcluster.imagePullPolicy }}{{ .Values.vcluster.imagePullPolicy }}{{ else }}{{ .Values.api.imagePullPolicy }}{{ end }}
{{- end }}

{{/*
  handles both vcluster and api extraVolumeMounts
*/}}
{{- define "vcluster.apipullpolicy" -}}
{{ if .Values.vcluster.extraVolumeMounts }}{{ .Values.vcluster.extraVolumeMounts }}{{ else }}{{ .Values.api.extraVolumeMounts }}{{ end }}
{{- end }}

{{/*
  handles both vcluster and api volumeMounts
*/}}
{{- define "vcluster.apipullpolicy" -}}
{{ if .Values.vcluster.volumeMounts }}{{ .Values.vcluster.volumeMounts }}{{ else }}{{ .Values.api.volumeMounts }}{{ end }}
{{- end }}

{{/*
  handles both vcluster and api env
*/}}
{{- define "vcluster.apipullpolicy" -}}
{{ if .Values.vcluster.env }}{{ .Values.vcluster.env }}{{ else }}{{ .Values.api.env }}{{ end }}
{{- end }}

{{/*
  handles both vcluster and api env
*/}}
{{- define "vcluster.apipullpolicy" -}}
{{ if .Values.vcluster.env }}{{ .Values.vcluster.env }}{{ else }}{{ .Values.api.env }}{{ end }}
{{- end }}

