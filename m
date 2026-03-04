Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFC63195EA
	for <linux-coco@lists.linux.dev>; Wed,  4 Mar 2026 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636466; cv=none; b=kU9ORBIzPTmjaCEvnzxi0pRHQY/zAu1Ie+wLzXjLHsr10jhGASPHswiKCm3DvdbU3bz0VKJewVdoyzGqZgosDyvKoqS78ZBE2jpvxAfvFD9dyxi0ayIynJJ1IZUWZ5waYJ2A39UYESjZRB8dCcRmNDL/sW9dk0Mb7qqsF5UhGCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636466; c=relaxed/simple;
	bh=mCLb0PHQAeQDx00dGHuwh3g1vsMSqGYmFbHwGRfEcTo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uD/0MQ+WD5ijH60FjPdleKAUHfZCTssste3iHmo99yGS8o4jKI+Zd+ZayeEl937PrwM9hxagCDWAHqURArmfCE1lIgqLwWijBmDVLry0JgWw+5NIRxw3w49qLXmlgxL2B/fyzhCM9+jDXgF1JxRISlppRSANmInqFpKQO9bhGCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fxa7/GaQ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fxa7/GaQ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ae415b68b1so42603185ad.2
        for <linux-coco@lists.linux.dev>; Wed, 04 Mar 2026 07:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772636464; x=1773241264; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J9mFnYWcgeVruYPIwAypZtO50oTC/FQ8Br8I5CLuM3M=;
        b=fxa7/GaQxDawa4uX7H6wdTwpZWNnX8Pbl8UBQjiiGwhfFJ0+bWfNwa8TGokGoHQKIm
         YpNdm3ah93haK4/MJMKAlcG0TZKhAehop5DT/pTFSCMxZlEuAjV66n1uc5YWFBmQ1w/S
         7RDoG+4lWUMXMRw9y0LUtTIBQjJ6DlJw+dVLbJBCoytkPYoQjP1ppYkiEe6PrYcqR0Ri
         5HDr4beC0eAgl4sSpmL8BIKB4sH69130/nS92LEMlVr17impmPonJle9NMZ46rw97Ldn
         5aKs9yEf+NwZvbsqjcofNrXEprBphijtu1CgtfbdiXRJiO2dezevlXUH2FTZeXAegCo+
         D2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636464; x=1773241264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9mFnYWcgeVruYPIwAypZtO50oTC/FQ8Br8I5CLuM3M=;
        b=WKacdRhuPwwkH1HKk9yvnOHwZ04Jagd28FPSqslL6Np637Y+hg1zWrSKTREwVb7gz7
         OVtq3psPM7ZHlSsODHTynz1qv1eOFwsVpclvV7YYa6NvK8Q3/DbL++RN52Np77W9i1i9
         csbzgHqoLsprqT8wmNaN49gzj09udIM7XX870AR/GY9D3flJ9q2aO8aaBhDB6o4R74Yx
         H8P/c6zMLAnCU7uFDlRQXdNUqPt1Sza8S3SapZD+A8NvZheF+tq18s89SN/0ChgTEzkg
         u/1mbeCvWPcbcfjdbvxMoA7tRCsQTETWwFV9Jxe89mlyipGEtimCFKhJ6hodUJ05OYp8
         NQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCTaJeJ4w6cguxH4STBoQX1E+h7rlOxHKOhPw3xaeX4W4kFlsKp58MYVr8oputdrhJx3MwnLj7hWpe@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0jNosED6XJFQ7RdNVK1FsE9jOFxtKWwTdZI9gZW8ZGnuDurLn
	nIHB18e0RMIzWHBgqrryYJOaff8/X4jEQchwPyWCk+Kd1UX80YYgCq8dRkkFDdd6rVrfNK9xfob
	8hEyKbA==
X-Received: from plblq5.prod.google.com ([2002:a17:903:1445:b0:2ae:4e8d:56b4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41d0:b0:2ae:6779:c8bb
 with SMTP id d9443c01a7336-2ae6aa0f17emr19749075ad.5.1772636463462; Wed, 04
 Mar 2026 07:01:03 -0800 (PST)
Date: Wed, 4 Mar 2026 07:01:02 -0800
In-Reply-To: <8dc0198f1261f5ae4b16388fc1ffad5ddb3895f9.1772486459.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1772486459.git.ashish.kalra@amd.com> <8dc0198f1261f5ae4b16388fc1ffad5ddb3895f9.1772486459.git.ashish.kalra@amd.com>
Message-ID: <aahH4XARlftClMrQ@google.com>
Subject: Re: [PATCH v2 3/7] x86/sev: add support for RMPOPT instruction
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	peterz@infradead.org, thomas.lendacky@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, ardb@kernel.org, pbonzini@redhat.com, aik@amd.com, 
	Michael.Roth@amd.com, KPrateek.Nayak@amd.com, Tycho.Andersen@amd.com, 
	Nathan.Fontenot@amd.com, jackyli@google.com, pgonda@google.com, 
	rientjes@google.com, jacobhxu@google.com, xin@zytor.com, 
	pawan.kumar.gupta@linux.intel.com, babu.moger@amd.com, dyoung@redhat.com, 
	nikunj@amd.com, john.allen@amd.com, darwi@linutronix.de, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 02, 2026, Ashish Kalra wrote:
> @@ -500,6 +508,61 @@ static bool __init setup_rmptable(void)
> +/*
> + * 'val' is a system physical address aligned to 1GB OR'ed with
> + * a function selection. Currently supported functions are 0
> + * (verify and report status) and 1 (report status).
> + */
> +static void rmpopt(void *val)
> +{
> +	asm volatile(".byte 0xf2, 0x0f, 0x01, 0xfc"
> +		     : : "a" ((u64)val & PUD_MASK), "c" ((u64)val & 0x1)
> +		     : "memory", "cc");
> +}
> +
> +static int rmpopt_kthread(void *__unused)
> +{
> +	phys_addr_t pa_start, pa_end;
> +
> +	pa_start = ALIGN_DOWN(PFN_PHYS(min_low_pfn), PUD_SIZE);
> +	pa_end = ALIGN(PFN_PHYS(max_pfn), PUD_SIZE);
> +
> +	/* Limit memory scanning to the first 2 TB of RAM */
> +	pa_end = (pa_end - pa_start) <= SZ_2T ? pa_end : pa_start + SZ_2T;
> +
> +	while (!kthread_should_stop()) {
> +		phys_addr_t pa;
> +
> +		pr_info("RMP optimizations enabled on physical address range @1GB alignment [0x%016llx - 0x%016llx]\n",
> +			pa_start, pa_end);
> +
> +		/*
> +		 * RMPOPT optimizations skip RMP checks at 1GB granularity if this range of
> +		 * memory does not contain any SNP guest memory.
> +		 */
> +		for (pa = pa_start; pa < pa_end; pa += PUD_SIZE) {
> +			/* Bit zero passes the function to the RMPOPT instruction. */
> +			on_each_cpu_mask(cpu_online_mask, rmpopt,
> +					 (void *)(pa | RMPOPT_FUNC_VERIFY_AND_REPORT_STATUS),
> +					 true);
> +
> +			 /* Give a chance for other threads to run */

I'm not terribly concerned with other threads, but I am most definitely concerned
about other CPUs.  IIUC, *every* time a guest_memfd file is destroyed, the kernel
will process *every* 2MiB chunk of memory, interrupting *every* CPU in the process.

Given that the whole point of RMPOPT is to allow running non-SNP and SNP VMs
side-by-side, inducing potentially significant jitter when stopping SNP VMs seems
like a dealbreaker.

Even using a kthread seems flawed, e.g. if all CPUs in the system are being used
to run VMs, then the kernel could be stealing cycles from an arbitrary VM/vCPU to
process RMPOPT.  Contrast that with KVM's NX hugepage recovery thread, which is
spawned in the context of a specific VM so that recovering steady state performance
at the cost of periodically consuming CPU cycles is bound entirely to that VM.

I don't see any performance data in either posted version.  Bluntly, this series
isn't going anywhere without data to guide us.  E.g. comments like this from v1

 : And there is a cost associated with re-enabling the optimizations for all
 : system RAM (even though it runs as a background kernel thread executing RMPOPT
 : on different 1GB regions in parallel and with inline cond_resched()'s),
 : we don't want to run this periodically.

suggest there is meaningful cost associated with the scan.
