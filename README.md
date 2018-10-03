# terraform-k8s-hetzner

**Launch a single-master kubernetes cluster with any number of workers in the [Hetzner Cloud](https://www.hetzner.de/cloud). 🚀**

The setup is particularly suitable for test scenarios that require a simple Kubernetes cluster without further add-ons. **Attention**: The setup is not recommended for productive use.

## Requirements

-   [Terraform](https://www.terraform.io/downloads.html) v0.11.8+
-   [Hetzner Cloud API Token](https://console.hetzner.cloud/projects)

## Usage

```
git clone https://github.com/cbrgm/terraform-k8s-hetzner.git
terraform init
terraform apply
```


Variable  |  Default | Description |  Required
--|---|---|--
`hcloud_token` | None | To create a new API token for your project, switch into the Hetzner Cloud Console choose a project, go to `Access` → `Tokens`, and create a new token.  |  True
`ẁorkers`  | 2| The number of worker nodes to join your cluster  | False

For more configuration changes please check the `variables.tf` file.

After Terraform has done the work, `kubeconfig` is located in the `creds/` folder of this project and ready for use!

## Contributing

-   **Fork** the project
-   **Patch** some code
-   **Push** your changes
-   Create a **Pull Request**

## Authors

-   Chris Bargmann (@[cbrgm](https://github.com/cbrgm))

## Acknowledgements

Thanks to @[s-urbaniak](https://github.com/s-urbaniak) and @ [solidnerd](https://github.com/solidnerd). Please also check out these projects for different setups:

* [https://github.com/s-urbaniak/k8s-hetzner](https://github.com/s-urbaniak/k8s-hetzner)
* [https://github.com/solidnerd](https://github.com/solidnerd/terraform-k8s-hcloud)

## License

```
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org>
```
