FROM quay.io/keycloak/keycloak:20.0.5 as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=false
ENV KC_FEATURES=web-authn
ENV KC_DB=postgres
WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:20.0.5
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak
#ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--import-realm", "--https-port=443"]
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--import-realm", "--https-port=443"]
EXPOSE 8443