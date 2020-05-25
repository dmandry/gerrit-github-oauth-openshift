FROM gerritcodereview/gerrit:3.1.4-centos7

USER root

RUN sed -i '4 a curl -L https://github.com/davido/gerrit-oauth-provider/releases/download/v3.1.3/gerrit-oauth-provider-gab09506.jar -o /var/gerrit/plugins/oauth.jar' /entrypoint.sh
RUN sed -i '16 a git config -f /var/gerrit/etc/gerrit.config auth.type OAUTH' /entrypoint.sh
RUN sed -i '17 a git config -f /var/gerrit/etc/gerrit.config auth.gitBasicAuthPolicy HTTP' /entrypoint.sh
RUN sed -i '18 a git config -f /var/gerrit/etc/gerrit.config plugin.gerrit-oauth-provider-github-oauth.client-id ${GITHUB_OAUTH_ID}' /entrypoint.sh
RUN sed -i '19 a git config -f /var/gerrit/etc/gerrit.config plugin.gerrit-oauth-provider-github-oauth.fix-legacy-user-id false' /entrypoint.sh
RUN sed -i '20 a git config -f /var/gerrit/etc/secure.config plugin.gerrit-oauth-provider-github-oauth.client-secret ${GITHUB_OAUTH_SECRET}' /entrypoint.sh

USER gerrit
