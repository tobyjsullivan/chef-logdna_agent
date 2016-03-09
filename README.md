logdna_agent Cookbook
=====================
Installs the LogDNA host agent. Currently only supports apt systems.


Attributes
----------

#### logdna_agent::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['logdna_agent']['api_key']</tt></td>
    <td>String</td>
    <td>Your API key as provided by LogDNA.</td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>['logdna_agent']['log_directories']</tt></td>
    <td>Array[String]</td>
    <td>Directories to follow (recursively) in addition to <var>/var/log</var>.</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['logdna_agent']['tags']</tt></td>
    <td>String</td>
    <td>(Optional) Comma-separated list of tags to apply to the host.</td>
    <td><tt>''</tt></td>
  </tr>
</table>

Usage
-----
#### logdna_agent::default
Just include `logdna_agent` in your node's `run_list` and set `api_key` and (optionally)`log_directories`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[logdna_agent]"
  ]
}
```

```ruby
node.set['logdna_agent']['api_key'] = 'XXXXXXXXXXXXXXXXXXXXXXXXX'
node.set['logdna_agent']['log_directories'] = ['/go/bin/']
```
