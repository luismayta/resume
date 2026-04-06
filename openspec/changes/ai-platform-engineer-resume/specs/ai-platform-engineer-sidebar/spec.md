## ADDED Requirements

### Requirement: Sidebar data for ai-platform-engineer profile
The system SHALL include sidebar content specific to the AI Platform Engineer profile.

#### Scenario: Skills are present
- **WHEN** the sidebar is rendered
- **THEN** skills include three categories: ML/AI Infrastructure, Platform Engineering, Cloud & DevOps

#### Scenario: Certifications are included
- **WHEN** sidebar content is loaded
- **THEN** certifications related to AWS/GCP/Azure ML, Kubernetes, and MLOps are present

### Requirement: Technical skills match role
The skills SHALL reflect the hybrid nature of AI Platform Engineer (MLOps + Platform + Cloud).

#### Scenario: ML/AI Infrastructure skills
- **WHEN** skills section is displayed
- **THEN** it includes: MLflow, Kubeflow, TensorFlow Serving, Triton Inference Server, ML pipelines, Feature stores, Model monitoring

#### Scenario: Platform Engineering skills
- **WHEN** skills section is displayed
- **THEN** it includes: Kubernetes, Docker, Terraform, ArgoCD, GitOps, Service mesh, Observability (Prometheus, Grafana, Loki)

#### Scenario: Cloud & DevOps skills
- **WHEN** skills section is displayed
- **THEN** it includes: AWS (SageMaker, EKS, Lambda), GCP (Vertex AI, GKE), Azure (Azure ML, AKS)

### Requirement: Education is relevant
The education section SHALL include relevant degrees for AI/ML and Platform Engineering.

#### Scenario: Degree is present
- **WHEN** education section is rendered
- **THEN** it shows Computer Science, Software Engineering, or related field