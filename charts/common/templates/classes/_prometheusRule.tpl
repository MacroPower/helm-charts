{{- define "bjw-s.common.class.prometheusRule" -}}
{{- $values := dict -}}
{{- if hasKey . "ObjectValues" -}}
  {{- with .ObjectValues.prometheusRule -}}
    {{- $values = . -}}
  {{- end -}}
{{ end -}}

{{- $prometheusRuleName := include "bjw-s.common.lib.chart.names.fullname" . -}}
{{- if and (hasKey $values "nameOverride") $values.nameOverride -}}
  {{- $prometheusRuleName = printf "%v-%v" $prometheusRuleName $values.nameOverride -}}
{{ end -}}
---
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: {{ $prometheusRuleName }}
  {{- with (merge ($values.labels | default dict) (include "bjw-s.common.lib.metadata.allLabels" $ | fromYaml)) }}
  labels: {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with (merge ($values.annotations | default dict) (include "bjw-s.common.lib.metadata.globalAnnotations" $ | fromYaml)) }}
  annotations: {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  groups: {{- toYaml (required (printf "groups are required for prometheusRule %v" $prometheusRuleName) $values.groups) | nindent 4 }}
{{- end }}
