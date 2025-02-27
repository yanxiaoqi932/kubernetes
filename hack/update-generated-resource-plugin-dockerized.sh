#!/usr/bin/env bash

# Copyright 2017 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script generates `*/api.pb.go` from the protobuf file `*/api.proto`.
# Example:
#   kube::protoc::generate_proto "${RESOURCE_PLUGIN_ALPHA}"

set -o errexit
set -o nounset
set -o pipefail

KUBE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../" && pwd -P)"
RESOURCE_PLUGIN_ALPHA="${KUBE_ROOT}/staging/src/k8s.io/kubelet/pkg/apis/resourceplugin/v1alpha1"

source "${KUBE_ROOT}/hack/lib/protoc.sh"
kube::protoc::generate_proto "${RESOURCE_PLUGIN_ALPHA}"
