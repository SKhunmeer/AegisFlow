# AegisFlow

**A Secure AI Agent Execution Gateway**

AegisFlow is a backend project designed to control how AI agents execute tools and interact with external systems. It aims to provide policy enforcement, human-in-the-loop approvals, idempotent execution, execution tracking, and audit logging.

## Core Objectives

- **Policy Enforcement** — Validate whether an agent is permitted to execute a requested tool.
- **Human Approval** — Require approval for sensitive operations.
- **Reliable Execution** — Track execution states and handle duplicate requests safely.
- **Auditability** — Maintain a history of execution requests and decisions.
- **Failure Recovery** — Build mechanisms for handling interrupted and failed executions.

## Tech Stack

- Python and FastAPI
- PostgreSQL
- SQLAlchemy 2.0
- Alembic
- Pydantic
- pytest
- Docker

## Architecture

AegisFlow follows a modular monolith architecture.

- `app/api/` — HTTP routes and API dependencies
- `app/core/` — Application configuration, logging, and shared utilities
- `app/db/` — Database configuration and SQLAlchemy models
- `app/schemas/` — API request and response schemas
- `app/modules/` — Business logic organized by feature
- `app/integrations/` — LLM and tool integrations
- `app/workers/` — Future background execution support
- `migrations/` — Database schema migrations
- `tests/` — Unit, integration, security, concurrency, and recovery tests

## Getting Started

### 1. Clone the repository

```bash
git clone <your-repository-url>
cd aegisflow
```

### 2. Create a virtual environment

```bash
python3 -m venv .venv
source .venv/bin/activate
```

### 3. Install dependencies

```bash
python -m pip install --upgrade pip
pip install -r requirements.txt
```

### 4. Configure environment variables

Copy `.env.example` to `.env` and configure the required values.

```bash
cp .env.example .env
```

Do not commit `.env` or real credentials.

### 5. Start the development server

Once the FastAPI entry point and health endpoint are configured:

```bash
uvicorn app.main:app --reload
```

Open `http://127.0.0.1:8000/docs` to explore the API, or use the health endpoint implemented in the project.

## Project Status

**Current stage: Initial backend scaffold.**

The project structure and configuration are being established. The execution engine, policy enforcement, approval workflows, idempotency, database operations, and AI agent integration will be implemented incrementally.

## Development Roadmap

- [ ] Establish the FastAPI application and health endpoint
- [ ] Configure PostgreSQL and SQLAlchemy
- [ ] Create database models and migrations
- [ ] Implement tool registration and policy enforcement
- [ ] Build the execution lifecycle
- [ ] Add approval workflows and idempotency
- [ ] Implement audit logging and failure recovery
- [ ] Add an LLM-based agent integration
- [ ] Expand automated testing
- [ ] Build and connect the frontend dashboard

## Design Principle

**The AI agent proposes actions; AegisFlow independently enforces whether those actions are allowed.**

The policy engine, not the language model, is responsible for authorization decisions.
