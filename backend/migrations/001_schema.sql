CREATE TABLE IF NOT EXISTS app_users(
  id BIGSERIAL PRIMARY KEY,email TEXT UNIQUE NOT NULL,name TEXT NOT NULL,role TEXT NOT NULL,password_hash TEXT NOT NULL,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS workflow_cases(
  id BIGSERIAL PRIMARY KEY,workflow_id TEXT NOT NULL,reference TEXT UNIQUE NOT NULL,subject TEXT NOT NULL,owner TEXT NOT NULL,state TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,payload JSONB NOT NULL DEFAULT '{}'::jsonb,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS audit_events(
  id BIGSERIAL PRIMARY KEY,event_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),actor TEXT NOT NULL,action TEXT NOT NULL,object_type TEXT NOT NULL,object_reference TEXT NOT NULL,detail TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS saved_analyses(
  id BIGSERIAL PRIMARY KEY,workflow_id TEXT NOT NULL,actor TEXT NOT NULL,analysis_type TEXT NOT NULL,inputs JSONB NOT NULL,result JSONB NOT NULL,provider TEXT NOT NULL,model TEXT,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS integration_state(
  id TEXT PRIMARY KEY,name TEXT NOT NULL,category TEXT NOT NULL,mode TEXT NOT NULL,status TEXT NOT NULL,last_tested TIMESTAMPTZ
);
CREATE INDEX IF NOT EXISTS idx_workflow_cases_workflow ON workflow_cases(workflow_id);
CREATE INDEX IF NOT EXISTS idx_workflow_cases_due ON workflow_cases(due_date);
CREATE INDEX IF NOT EXISTS idx_audit_events_time ON audit_events(event_time DESC);

CREATE TABLE IF NOT EXISTS "op_scope"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_scope_due ON "op_scope"(due_date);

CREATE TABLE IF NOT EXISTS "op_composition"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_composition_due ON "op_composition"(due_date);

CREATE TABLE IF NOT EXISTS "op_volume"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_volume_due ON "op_volume"(due_date);

CREATE TABLE IF NOT EXISTS "op_fee"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_fee_due ON "op_fee"(due_date);

CREATE TABLE IF NOT EXISTS "op_scheme"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_scheme_due ON "op_scheme"(due_date);

CREATE TABLE IF NOT EXISTS "op_declaration"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_declaration_due ON "op_declaration"(due_date);

CREATE TABLE IF NOT EXISTS "op_evidence"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_evidence_due ON "op_evidence"(due_date);

CREATE TABLE IF NOT EXISTS "op_forecast"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_forecast_due ON "op_forecast"(due_date);

CREATE TABLE IF NOT EXISTS "op_producer_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_producer_master_due ON "op_producer_master"(due_date);

CREATE TABLE IF NOT EXISTS "op_packaging_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_packaging_master_due ON "op_packaging_master"(due_date);

CREATE TABLE IF NOT EXISTS "op_jurisdiction_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_jurisdiction_master_due ON "op_jurisdiction_master"(due_date);

CREATE TABLE IF NOT EXISTS "op_scheme_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_scheme_master_due ON "op_scheme_master"(due_date);
