#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"

extern "C"
{
	void app_main();
}

static const char *TAG = "TEST_0000";

void app_main(void)
{
	for (;;)
	{
		ESP_LOGI(TAG, "Loop");
		vTaskDelay(1000);
	}
}
