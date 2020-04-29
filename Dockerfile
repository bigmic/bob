FROM mcr.microsoft.com/dotnet/core/sdk:3.1

ENV PATH="/root/.local/bin:${PATH}"
ENV PATH="/root/.dotnet/tools:${PATH}"


RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list


RUN apt update \
    && apt install \
    nodejs \
    yarn \
    zip \
    unzip \
    -y


RUN curl -O https://bootstrap.pypa.io/get-pip.py

RUN python get-pip.py --user

RUN pip install awscli --upgrade --user


RUN dotnet tool install -g Amazon.Lambda.Tools


RUN npm install -g serverless

RUN chown -R $USER:$(id -gn $USER) /root/.config



RUN dotnet --version

RUN npm --version

RUN node --version

RUN yarn --version

RUN python --version

RUN pip --version

RUN aws --version

RUN serverless --version