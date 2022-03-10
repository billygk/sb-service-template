package com.github.billygk.cloud.serviceq.consumers;

import com.github.billygk.cloud.serviceq.config.RabbitMqConfig;
import com.github.billygk.cloud.serviceq.dto.JobDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
public class ServiceQConsumerHandler {
    private static final Logger log = LoggerFactory.getLogger(ServiceQConsumerHandler.class);

    @RabbitListener(queues = RabbitMqConfig.QUEUE_NAME)
    public void sendEmail(JobDto job) {
        // Do something with queue element
        log.info("Job received: {} with data: {}", job.getJobType(), job.getJobData());
    }

}
