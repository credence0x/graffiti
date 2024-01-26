fn blob_trait() -> ByteArray {
    "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"
}

fn blob_head() -> ByteArray {
    "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgCAYAAAB91L6VAAAAAXNSR0IArs4c6QAACRRJREFUeJzt3EFo1nUcx/H/YgdFeAQnTcMGajOlEMrhFEddIohuHYKRO4qgRFKXoLPQZdBFYXgJChZBdfLWpdDcQi+SKA0MLJBAhR4Qvdm9FL6P+z/77PF5vc4//v/fUJ43/8unaQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADo3Uj6ArCedbZOpK+wprp3bqWvAEPjufQFAGAYCTAABAgwAAQIMAAECDAABAgwAAQIMAAECDAABAgwAASMpi8AbWp7uWrf9k7p3PXb3UetvrhlB/buKK3eXbnR7nsta8GT+QIGgAABBoAAAQaAAAEGgAABBoAAAQaAAAEGgAABBoAAAQaAgNI6DqRVF66md20pnVu+ea/V5arF44dK5yZnjrT52rKpuflWnze9a0vpt2P55r3S8yxmMYx8AQNAgAADQIAAA0CAAANAgAADQIAAA0CAAANAgAADQIAAA0CAJSyiqgtXk2ObSudW7t4vLVxVl6uqUgtXbVu5cLF0bnZhqXTOYhY8mS9gAAgQYAAIEGAACBBgAAgQYAAIEGAACBBgAAgQYAAIEGAACBhNX4DBUl2uqtrR2VA6V124OnV456ru81/PysJVVfXvXSw+b3ZhqfTvdmDvjtJi1pUbxRe3zAIX/eALGAACBBgAAgQYAAIEGAACBBgAAgQYAAIEGAACBBgAAgQYAAJK6zM8+6oLV28d3FM69+Ovv5cWkKqqC1fT+8dL54Zt4Wq9m5qbj7x3cmxT6Tdw5e790vMsZtELX8AAECDAABAgwAAQIMAAECDAABAgwAAQIMAAECDAABAgwAAQYAmLpmnqS1hN05QWri5/9cnTX2YVVi5cLJ2rLmF1JmoLXG07+2ltGeroifdK574++33p3InPM/9u3Vt/lM5V/46qLy7V3tsUfystYdELX8AAECDAABAgwAAQIMAAECDAABAgwAAQIMAAECDAABAgwAAQMJq+AMNtaq62+FRVXeCqLmYtX213eamqunDV9vOqC1xtm94/XjpXXa46dTizYAa98AUMAAECDAABAgwAAQIMAAECDAABAgwAAQIMAAECDAABAgwAAZaw6Mmbr744Ujk3NTf/qHIutVg0OXOkdO7gxx+Uzu1++fXVXOd/jp5o9XFlH375Xelc23/v5eJS12LxebMLS6VzOzobSv+f/+o+LL4Z6nwBA0CAAANAgAADQIAAA0CAAANAgAADQIAAA0CAAANAgAADQIAlLHry029/trpwNb1/fFX3YbhUF8ya4hJWdeGqe+dW7b3QA1/AABAgwAAQIMAAECDAABAgwAAQIMAAECDAABAgwAAQIMAAEDCSvgDrQ2frRPVoaQlr8fihp7/MKpSXknimTc3NV4+WfgMtYdEPvoABIECAASBAgAEgQIABIECAASBAgAEgQIABIECAASBAgAEgYDR9AfqrunC1b3undO767e5qrjP0Np47k75CKx4cO5m+Agw8X8AAECDAABAgwAAQIMAAECDAABAgwAAQIMAAECDAABAgwAAQYAmLpmma5vrt7qPKucXjh/p9lYFUXbh65eeHfb7J2rjW1P5ei1nwZL6AASBAgAEgQIABIECAASBAgAEgQIABIECAASBAgAEgQIABIMASFqyha29sSF8BWCd8AQNAgAADQIAAA0CAAANAgAADQIAAA0CAAANAgAADQIAAA0CAJSx6snz179K56f3jfb7JYHpw7GT6Cq3YeO5M5L0rFy5G3gv94AsYAAIEGAACBBgAAgQYAAIEGAACBBgAAgQYAAIEGAACBBgAAkbSF6C/OlsnSucmxzaVzq3cvf+ocu7U4Z2l56UWsyZnjkTey+NVF65mF5ZK56Z3bSn9ti3fvFd6XvfOrdI56IUvYAAIEGAACBBgAAgQYAAIEGAACBBgAAgQYAAIEGAACBBgAAiwhEXTNLnFrKrqslbbLHU9XnW5qsrCFcPIFzAABAgwAAQIMAAECDAABAgwAAQIMAAECDAABAgwAAQIMAAEWMKiJ9XFrKrqstbM7rHSubdfe6HVBa71vkj1rPjh/C+l36LT31wqPc/CFYPAFzAABAgwAAQIMAAECDAABAgwAAQIMAAECDAABAgwAAQIMAAEWMJiIJz/7P1Wn7dxc6d07sE/3VaXtdo2AEtdrf7G7HnnozYfB1G+gAEgQIABIECAASBAgAEgQIABIECAASBAgAEgQIABIECAASDAEhZDqe1lrT6ILHA9/9Lu0m/C5m3bWn2vhSuGkS9gAAgQYAAIEGAACBBgAAgQYAAIEGAACBBgAAgQYAAIEGAACLCEBWuoDwtcbS9mlX4T3j39bcuvheHjCxgAAgQYAAIEGAACBBgAAgQYAAIEGAACBBgAAgQYAAIEGAACRtMXgGFSXZDqw2KW1TtYZ3wBA0CAAANAgAADQIAAA0CAAANAgAADQIAAA0CAAANAgAADQIAlLBhsrS5cVZe6gNXzBQwAAQIMAAECDAABAgwAAQIMAAECDAABAgwAAQIMAAECDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPmX/h75oz6EFiZAAAAAElFTkSuQmCC"
}