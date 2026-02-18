Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8051301460
	for <linux-coco@lists.linux.dev>; Wed, 18 Feb 2026 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771432111; cv=none; b=QWEKhq6u9beVfM+VJ3t9mkZzAfXkx/aWKmqFkCwCbuFaK3/lxCJIHDHVl/ecgO2HGj5BWD0o/nyz/1q5Y/hDFFdXzd5SJ+cFL/o2xZaKCXNLe1ikvwmKCqMPu3pj8WsADFnoc10vTiewLhGIhZbTeKmoeQLk8P97nMbcXkaZt3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771432111; c=relaxed/simple;
	bh=l6yGQpInHHh1jxWiSTXfMpcfIB/+CdobiVII3dGD54Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=syuhPwLnrwdrAf3gP8ij07lAFPDLFgnmChnzXNXIlCsv/sv1Bp28VikJcHWkT8/aGMwpvY1WI8+XVO9IIjkUNU73Z95xzzROo3KOMdOQKZdCI1yp9cr0X7WBhurLtsxprfRxaXhyOc5NN0YmyS17xVDdmgLKhsIddRPjMcWw8Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zjr1iS/8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zjr1iS/8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43621bf67ceso9832f8f.2
        for <linux-coco@lists.linux.dev>; Wed, 18 Feb 2026 08:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771432108; x=1772036908; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iojUpQORmA6q2fiJwfUXXrXkOovQJ/gRPbEyrdAFY1Y=;
        b=Zjr1iS/8qoxhRUD/afrAOIF2RRmdTx4crLBSQnmk4z+gCb4LxbL/Fay7YkCna0zIC+
         EPUdvLRYAj64z0kmzBQgf1Imb/JfP5eIyYxjoqVeCzEnp9kq4NiFAXQf4mTFiTExLDCJ
         9L9CIaFvh79J3au/vdyoNBNWrOBDjYWzWbN/teFkFAhWL8zm0ZhiWAbpYc2dRcvBoY78
         bxKUgBOM9ycdVv3t6fWjEDFgfkggCE34HyW4Jh3vxZYSB5EAiBJKYKkMIjnv/tG0AK1z
         PU+cAbOUJ/6B2HSW+6RZ3Zi5AWBH2Lq6WJnQUYy60GE0x3seEUNkor8tThKrEi2HAUNa
         2JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771432108; x=1772036908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iojUpQORmA6q2fiJwfUXXrXkOovQJ/gRPbEyrdAFY1Y=;
        b=UlCBYcXB0qkPlNJYaUxtfUDyLr4qws/leDuXsY/YxUAEZwZLb55LEKMBKVyMJfxqbE
         1CZFahxIkU4kMCNIBF2QV2fuSS2CLfCpy02C+KA9oUv1vLRFaPHgOEdwgybsP6Lplcc7
         nkgnGCJCPvpweEh1JtRBWO46AXbNQskyt96+eRpNWsJu3kKczFJi6loHDuomeQGcA3tP
         owOZ8E8J4bKKVOto7atJI7AAtTsHmt+DervWTemBCSAkLgsvIGBxiiJGJwAKyVVkzZus
         qKg3PCCYZJzJbDXrmrRchZwV3oE8NdPszhHDdfBCaLuaISdRTGusVxVMg5V384OBu9Lg
         mhiw==
X-Forwarded-Encrypted: i=1; AJvYcCW8M67sdkcOULfPw9NF7x7PaEgDPo/HJxjVtcVqw+yyib0SoXAB2nfgCr336hbyHKj4uEflhNQ6HtRL@lists.linux.dev
X-Gm-Message-State: AOJu0YzaJdBRGRj8f1QqrnHN2MWuQddox9E2NkyDfgZUAU9cO2JYW9Mv
	epx5/hwlnOVWY8epqklarw3l/ahwJMgVidfySskJAcWYljTCapQpsc11
X-Gm-Gg: AZuq6aIwjlNRVNo2UE6PIgvJaynzo7R0Ag9qVCzKjhe+xAZFQhtOxudm0fuct/snlW9
	eT3JkkSOhwjhss1hIzJk6G4i4vuokBJiUO+rKTm4/M7oy8Vj5r6hvWXb28Rp7bap7Aue/m0c/7G
	LTilVuokeNklQBAEwcRvstXa2pOJetFOhYikUfsKMNXJU1auCxhBWdvxN/6rBoaKdzCYcMY2kAU
	ymWQF0swy4hVx1oLVT3VLG5zWtaLAGIUoT5obloBnAYOiEgbnWCH0o9Jjm0B9cTZI58Mk97Dnbz
	bLdWh+0W4HQpnpzbVdlS6soSDlciPKabFtay3NyOKpFCdtCirt4pw2/jyf9K2o6bDLUz/WJvqS5
	KKaE091E7JJnZvy4pDqoUAD8KGwwcxF2O2wzgB5lCWoQq0Nqnr2YOWqh/oQ5xs+UTN8BQ8UjX8c
	Y0P3ZSbtBsiKkd+CdhDSHHfN57fxS3H+VYd3yrd4h5UVl1zxIp8h5GelfAOFrjm55tjxmj45YY+
	j0D3WIZjk0yyfTfB/VnirqlPPVhbLUAKP+7hPYiUSofUPO9S12nejK7
X-Received: by 2002:a5d:5d10:0:b0:437:7168:af4f with SMTP id ffacd0b85a97d-4379db6485emr29058399f8f.27.1771432107727;
        Wed, 18 Feb 2026 08:28:27 -0800 (PST)
Received: from [192.168.1.100] ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm42798707f8f.31.2026.02.18.08.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 08:28:27 -0800 (PST)
Message-ID: <e00f9f7e-1915-473b-977a-751b6e28a54f@gmail.com>
Date: Wed, 18 Feb 2026 17:28:17 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86/sev: add support for RMPOPT instruction
To: Ashish Kalra <Ashish.Kalra@amd.com>, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 seanjc@google.com, peterz@infradead.org, thomas.lendacky@amd.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, ardb@kernel.org
Cc: pbonzini@redhat.com, aik@amd.com, Michael.Roth@amd.com,
 KPrateek.Nayak@amd.com, Tycho.Andersen@amd.com, Nathan.Fontenot@amd.com,
 jackyli@google.com, pgonda@google.com, rientjes@google.com,
 jacobhxu@google.com, xin@zytor.com, pawan.kumar.gupta@linux.intel.com,
 babu.moger@amd.com, dyoung@redhat.com, nikunj@amd.com, john.allen@amd.com,
 darwi@linutronix.de, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev
References: <cover.1771321114.git.ashish.kalra@amd.com>
 <66348e8ad761a1b0ccb26c8027efedf46329db54.1771321114.git.ashish.kalra@amd.com>
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <66348e8ad761a1b0ccb26c8027efedf46329db54.1771321114.git.ashish.kalra@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/17/26 21:10, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> As SEV-SNP is enabled by default on boot when an RMP table is
> allocated by BIOS, the hypervisor and non-SNP guests are subject to
> RMP write checks to provide integrity of SNP guest memory.
> 
> RMPOPT is a new instruction that minimizes the performance overhead of
> RMP checks on the hypervisor and on non-SNP guests by allowing RMP
> checks to be skipped for 1GB regions of memory that are known not to
> contain any SEV-SNP guest memory.
> 
> Enable RMPOPT optimizations globally for all system RAM at RMP
> initialization time. RMP checks can initially be skipped for 1GB memory
> ranges that do not contain SEV-SNP guest memory (excluding preassigned
> pages such as the RMP table and firmware pages). As SNP guests are
> launched, RMPUPDATE will disable the corresponding RMPOPT optimizations.
> 
> Suggested-by: Thomas Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>   arch/x86/virt/svm/sev.c | 84 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 84 insertions(+)
> 
> diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
> index e6b784d26c33..a0d38fc50698 100644
> --- a/arch/x86/virt/svm/sev.c
> +++ b/arch/x86/virt/svm/sev.c
> @@ -19,6 +19,7 @@
>   #include <linux/iommu.h>
>   #include <linux/amd-iommu.h>
>   #include <linux/nospec.h>
> +#include <linux/kthread.h>
>   
>   #include <asm/sev.h>
>   #include <asm/processor.h>
> @@ -127,10 +128,17 @@ static DEFINE_SPINLOCK(snp_leaked_pages_list_lock);
>   
>   static unsigned long snp_nr_leaked_pages;
>   
> +enum rmpopt_function {
> +	RMPOPT_FUNC_VERIFY_AND_REPORT_STATUS,
> +	RMPOPT_FUNC_REPORT_STATUS
> +};
> +
>   #define RMPOPT_TABLE_MAX_LIMIT_IN_TB	2
>   #define NUM_TB(pfn_min, pfn_max)	\
>   	(((pfn_max) - (pfn_min)) / (1 << (40 - PAGE_SHIFT)))
>   
> +static struct task_struct *rmpopt_task;
> +
>   struct rmpopt_socket_config {
>   	unsigned long start_pfn, end_pfn;
>   	cpumask_var_t cpulist;
> @@ -527,6 +535,66 @@ static void get_cpumask_of_primary_threads(cpumask_var_t cpulist)
>   	}
>   }
>   
> +/*
> + * 'val' is a system physical address aligned to 1GB OR'ed with
> + * a function selection. Currently supported functions are 0
> + * (verify and report status) and 1 (report status).
> + */
> +static void rmpopt(void *val)
> +{
> +	asm volatile(".byte 0xf2, 0x0f, 0x01, 0xfc\n\t"

There is no need for \n\t instruction delimiter with single instruction 
in the asm template, it will just confuse compiler's insn count estimator.

Uros.

> +		     : : "a" ((u64)val & PUD_MASK), "c" ((u64)val & 0x1)
> +		     : "memory", "cc");
> +}
> +
> +static int rmpopt_kthread(void *__unused)
> +{
> +	phys_addr_t pa_start, pa_end;
> +	cpumask_var_t cpus;
> +
> +	if (!zalloc_cpumask_var(&cpus, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	pa_start = ALIGN_DOWN(PFN_PHYS(min_low_pfn), PUD_SIZE);
> +	pa_end = ALIGN(PFN_PHYS(max_pfn), PUD_SIZE);
> +
> +	while (!kthread_should_stop()) {
> +		phys_addr_t pa;
> +
> +		pr_info("RMP optimizations enabled on physical address range @1GB alignment [0x%016llx - 0x%016llx]\n",
> +			pa_start, pa_end);
> +
> +		/* Only one thread per core needs to issue RMPOPT instruction */
> +		get_cpumask_of_primary_threads(cpus);
> +
> +		/*
> +		 * RMPOPT optimizations skip RMP checks at 1GB granularity if this range of
> +		 * memory does not contain any SNP guest memory.
> +		 */
> +		for (pa = pa_start; pa < pa_end; pa += PUD_SIZE) {
> +			/* Bit zero passes the function to the RMPOPT instruction. */
> +			on_each_cpu_mask(cpus, rmpopt,
> +					 (void *)(pa | RMPOPT_FUNC_VERIFY_AND_REPORT_STATUS),
> +					 true);
> +
> +			 /* Give a chance for other threads to run */
> +			cond_resched();
> +		}
> +
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		schedule();
> +	}
> +
> +	free_cpumask_var(cpus);
> +	return 0;
> +}
> +
> +static void rmpopt_all_physmem(void)
> +{
> +	if (rmpopt_task)
> +		wake_up_process(rmpopt_task);
> +}
> +
>   static void __configure_rmpopt(void *val)
>   {
>   	u64 rmpopt_base = ((u64)val & PUD_MASK) | MSR_AMD64_RMPOPT_ENABLE;
> @@ -687,6 +755,22 @@ static __init void configure_and_enable_rmpopt(void)
>   	else
>   		configure_rmpopt_large_physmem(primary_threads_cpulist);
>   
> +	rmpopt_task = kthread_create(rmpopt_kthread, NULL, "rmpopt_kthread");
> +	if (IS_ERR(rmpopt_task)) {
> +		pr_warn("Unable to start RMPOPT kernel thread\n");
> +		rmpopt_task = NULL;
> +		goto free_cpumask;
> +	}
> +
> +	pr_info("RMPOPT worker thread created with PID %d\n", task_pid_nr(rmpopt_task));
> +
> +	/*
> +	 * Once all per-CPU RMPOPT tables have been configured, enable RMPOPT
> +	 * optimizations on all physical memory.
> +	 */
> +	rmpopt_all_physmem();
> +
> +free_cpumask:
>   	free_cpumask_var(primary_threads_cpulist);
>   }
>   

