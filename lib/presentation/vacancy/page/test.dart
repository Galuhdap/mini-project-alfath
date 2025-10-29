 Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: _isSearchVisible ? 70 : 0,
                              curve: Curves.easeInOut,
                              child: _isSearchVisible
                                  ? SearchJobVacancyWidget(
                                      controller: TextEditingController(),
                                      onTap: () {},
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            Expanded(
                              child: ListView.builder(
                                controller: _scrollController,
                                itemCount: jobs.length,
                                itemBuilder: (context, index) {
                                  final job = jobs[index];
                                  return CardJobVacancyWidget(
                                    title: job.pekerjaan.nama,
                                    type: 'hh',
                                    companyName: 'Nama Company',
                                    location: 'Surabaya, Indonesia',
                                    postedDate: '17/08/2024',
                                    status: 'Open',
                                    onTap: () {
                                      context.push(DetailVacancyPage());
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );