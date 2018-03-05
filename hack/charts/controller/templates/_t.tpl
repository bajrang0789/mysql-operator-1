---
apiVersion: apiextensions.k8s.io/v1beta1
kind: CustomResourceDefinition
metadata:
  name: mysqlclusters.titanium.presslabs.net
  labels:
    app: {{ template "name" . }}
    chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
    release: {{ .Release.Name }}
    heritage: {{ .Release.Service }}
spec:
  scope: Namespaced
  group: titanium.presslabs.net
  version: v1alpha1
  scope: Namespaced
  names:
    kind: MysqlCluster
    plural: mysqlclusters
    shortNames:
      - mysql
  validation:
   # openAPIV3Schema is the schema for validating custom objects.
    openAPIV3Schema:
      required:
        - spec
      properties:
        spec:
          type: object
          required:
            - secretName
          properties:
            secretName:
              type: string
              minLength: 1
              maxLength: 63
              pattern: '^([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9]$'
