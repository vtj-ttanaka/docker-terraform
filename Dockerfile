FROM golang:1.18-buster as build

WORKDIR /workdir

ENV TERRAFORM_VERSION v1.2.1

RUN git clone -b ${TERRAFORM_VERSION} --single-branch https://github.com/hashicorp/terraform.git

WORKDIR /workdir/terraform

RUN go build

FROM gcr.io/distroless/base-debian11

COPY --from=build /workdir/terraform/terraform /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/terraform"]
CMD ["--help"]
