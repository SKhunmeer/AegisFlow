"""Version 1 API router."""

from fastapi import APIRouter

from aegisflow.app.api.v1.endpoints import health

router = APIRouter()
router.include_router(health.router, tags=["health"])
