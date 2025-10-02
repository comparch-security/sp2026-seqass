#include <sys/select.h>
#include <riscv/abstract_device.h>
#include <riscv/simif.h>
#include <riscv/abstract_interrupt_controller.h>
#include <riscv/mmu.h>
#include <riscv/processor.h>
#include <riscv/simif.h>
#include <riscv/sim.h>
#include <riscv/dts.h>
#include <fdt/libfdt.h>
#include "virtio.h"

#define VIRTIO_BASE_ADDR 0x40010000
#define VIRTIO_SIZE      0x1000
#define VIRTIO_IRQ       1

class virtioblk_t: public virtio_base_t {
public:
  virtioblk_t(
      const simif_t* sim,
      abstract_interrupt_controller_t *intctrl,
      uint32_t interrupt_id,
      std::vector<std::string> sargs);
  ~virtioblk_t();
private:
};