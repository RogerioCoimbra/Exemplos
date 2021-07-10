using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace WorkerService2
{
    public class Worker : BackgroundService
    {
        private readonly JokeService _jokeService;
        private readonly ILogger<Worker> _logger;

        public Worker(
            JokeService jokeService,
            ILogger<Worker> logger) =>
            (_jokeService, _logger) = (jokeService, logger);

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                try
                {
                    string joke = await _jokeService.GetJokeAsync();
                    _logger.LogWarning(joke);

                    await Task.Delay(TimeSpan.FromMinutes(1), stoppingToken);
                }
                catch (OperationCanceledException)
                {
                    break;
                }
            }
        }
    }
}
