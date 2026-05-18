Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC12FE074
	for <linux-coco@lists.linux.dev>; Mon, 18 May 2026 22:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779144749; cv=none; b=hbtJ2Gcv4EEdAiOwiUJ0+ENqgtwCtBHJBjTQVHdRkxojxC6tOH+cI/a5/GmySsy0ZlxqQoD/lNW8AhJHvFxZFu9LFg2a229paHlJvxJ9sIom6QT7uavOTprE+EwL2xKnG+a4artcwT2tz9pmiX+D5iegC8nkus6ts2Lc0tVccbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779144749; c=relaxed/simple;
	bh=GXFirbRQY8eofGnX+XhCUeN8t+xObvng6WItNjs0XUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgNMlXW6oWAC8G2UPLu0YgkTWPpstrZ+gfhczt7hfw/QvvSOW/Y6dEQdG8Q5j4GDXhC68ZhTUG4ztkbjyud94g+EeivXp7m4jB0yJ0vWi6Kxb3m0o8aWVFIBVUx5N/cA3aOqkjuf9cMdaZlRy16aFpLLG5tVmehClBq94rNXzzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HuD6fs89; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HuD6fs89"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-366139223e4so1498266a91.0
        for <linux-coco@lists.linux.dev>; Mon, 18 May 2026 15:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779144747; x=1779749547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HLMyqZOyNhfQqrj2PAOWk68Yiq/VRAM+JvdOW2MXk6o=;
        b=FZZ6qEG4OkBdIT9oqK3/xx0BN75OqttLcFxmqzAIE2URf+z5Rjrwvax7PCLfSWwY51
         D3XjI/Kg0kJPc7uuNd/T5GoYEgbehXUuo1EBB2dNpv+KS5qVlEczKB3N/6lkp3zlqtEj
         Gue4B6K2UI0S6zNik9kIrrZF2wGkVgkHZ4vrj9bUXbXCgI62lZZcuG3x/Nie9jw0Z2EA
         SnZls0B0vDJaS/J/gavMgz1X57VCwO+d0YhaBep5DJlNjGgCIFKh6KyJayurx8R9y7d6
         PY7vCsYh8SX37EfUedRp/ALNiplEF0Np0xN8lqtwa2LGcdBpJX7NGhBHmhDCQbrjZ/y0
         Q0Sw==
X-Forwarded-Encrypted: i=1; AFNElJ/lVMYBP6DDEQNhko8uIQlJqWgajTO15Vi+RiqIMs+2H57W3l12VMrPFCxdf9NYZPR6ecPd5n3CePgc@lists.linux.dev
X-Gm-Message-State: AOJu0YyvdOGYJtBR5BtlOPkoHSTW9f8psvwSIQCWL/gMoCHh/0ONU05U
	aI+XnreK//zGgG0Jd7P2lE5duzqc1gtVgj34nCyU6iA9an955mB5mx8rQUnRiXt45zbOd7gylcT
	yB/d1zQxuP8gjRayzUctBzt9UDi9JPnu7zvm7Pt3O5ngoFGae3WcFMNeFEQSMonZ/rO6JTzWLue
	1zxcv56U4Y0niICGjkgfBHFDIXyb61wXvYv6hYcc9CQLI4EGFa9uy0irJNHwRNAR9EdWffTc0wr
	DvUkfGgV45pUeT0ZkOk
X-Gm-Gg: Acq92OED/OUEI1VgY4MRi7ljuUN7iEakIQiXhqZXtvzhyitovWJRCzjl+dbVfnErGqF
	k8SR3/UbGNk50hb84n8KJJ7uetFdZpxYXGAOksB8xRttO6wuIUTDsqIWpT0vFBBpIU2I2VGkwU/
	Gf0HqGV7L/W8ECraFdv4Du7QNsmVTMPGY2HOKm9CIRjw5hkPUb8ntj0YRbJ6K7XmQPjzZnXHXR3
	V0Q9D4qPXuXtjF2GwMqyPCSQjwhG2VdDD1r4uLvCVDTZRlYR+YHRJjv0cX9r8B1kKGWeUIOg9Wp
	OOGlz11lhGszEDo5AQKIWgw8BLqL6rsfhf3Z7PF5P8Dkphc7SIZSbNmofyxRlXUHM96U2FgXSkU
	FFO6rPGFh21ZVb3HZRLPvUdS8cVY4oPaQS1+DsvJPYu21j/DyagAMX5wt5TXq9WFa6pH0ihYndz
	F1aWjZBYf5Q2bz2GzSkHs8oDQq6CqTeiHPN4bSdVK9cb0SqzXvlgr4D0VMRsvP
X-Received: by 2002:a17:90a:2ce5:b0:369:7433:488 with SMTP id 98e67ed59e1d1-369743305dbmr7411708a91.2.1779144747206;
        Mon, 18 May 2026 15:52:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-24.dlp.protect.broadcom.com. [144.49.247.24])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-36951283c6asm925338a91.1.2026.05.18.15.52.26
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 May 2026 15:52:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b3fe2f190bso63559426d6.2
        for <linux-coco@lists.linux.dev>; Mon, 18 May 2026 15:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779144746; x=1779749546; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HLMyqZOyNhfQqrj2PAOWk68Yiq/VRAM+JvdOW2MXk6o=;
        b=HuD6fs89sEQqEHe3my0g93k6qsJ5Rcu5JPT4vwOahKv0HBub/V1NAm9OVicd+m9wa7
         HoVCJuVJEAY/Llc5vyg8ZfhgfuVrnUEsMfWAecq1+BEAfjdYPDAGMeNGxxwl6EuYj1EG
         j3cGJQHWJm4swahNbZqdNSIKLwC/Yn9XNJkrs=
X-Forwarded-Encrypted: i=1; AFNElJ/9uOlbEYuIwHCb4K8hS9AmGXaAFs7d+J7HO6IsQ2jjh/3Mx8wDLVzcJqOuZm/b8iANeLHN6nXUg17/@lists.linux.dev
X-Received: by 2002:a05:6214:2343:b0:8ca:257d:1861 with SMTP id 6a1803df08f44-8ca257d1abbmr173747786d6.33.1779144745999;
        Mon, 18 May 2026 15:52:25 -0700 (PDT)
X-Received: by 2002:a05:6214:2343:b0:8ca:257d:1861 with SMTP id 6a1803df08f44-8ca257d1abbmr173747486d6.33.1779144745575;
        Mon, 18 May 2026 15:52:25 -0700 (PDT)
Received: from [10.66.193.70] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3619c703sm71370436d6.33.2026.05.18.15.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 15:52:24 -0700 (PDT)
Message-ID: <70843c91-b1f7-4f5b-9960-43390df6dd2d@broadcom.com>
Date: Mon, 18 May 2026 15:52:21 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] x86/vmware: Hypercall refactoring and improved
 guest support
To: x86@kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Cc: ajay.kaher@broadcom.com, brennan.lamoreaux@broadcom.com,
 bo.gan@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org, kas@kernel.org, rick.p.edgecombe@intel.com,
 linux-coco@lists.linux.dev
References: <20260307004238.1181299-1-alexey.makhalov@broadcom.com>
 <20260309235250.2611115-1-alexey.makhalov@broadcom.com>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20260309235250.2611115-1-alexey.makhalov@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 3/9/26 4:52 PM, Alexey Makhalov wrote:
> This series improves VMware guest support on x86 by refactoring the
> hypercall infrastructure and adding better crash diagnostics, along
> with encrypted guest support for the steal time clock.
> 
> The first patch introduces a common vmware_hypercall() backend selected
> via static calls. It consolidates the existing hypercall mechanisms
> (backdoor, VMCALL/VMMCALL, and TDX) behind a single interface and
> selects the optimal implementation at boot. This reduces duplication
> and simplifies future extensions.
> 
> Building on top of the new hypercall infrastructure, the next two
> patches improve post-mortem debugging of VMware guests. They export
> panic information to the hypervisor by dumping kernel messages to the
> VM vmware.log on the host and explicitly reporting guest crash event
> to the hypervisor.
> 
> The final patch adds support for encrypted guests by ensuring that the
> shared memory used for the steal time clock is mapped as decrypted
> before being shared with the hypervisor. This enables steal time
> accounting to function correctly when guest memory encryption is
> enabled.
> 
> Patch overview:
> 
> 1. x86/vmware: Introduce common vmware_hypercall
> 
>     * Consolidate hypercall implementations behind a common API
>     * Select backend via static_call at boot
> 
> 2. x86/vmware: Log kmsg dump on panic
> 
>     * Register a kmsg dumper
>     * Export panic logs to the host
> 
> 3. x86/vmware: Report guest crash to the hypervisor
> 
>     * Register a panic notifier
>     * Notify the hypervisor about guest crashes
> 
> 4. x86/vmware: Support steal time clock for encrypted guests
> 
>     * Mark shared steal time memory as decrypted early in boot
> 
> 
> Changelog:
> 
> V1 -> V2
>     * Fix compilation warnings in patch 2 "x86/vmware: Log kmsg dump on panic"
>       reported by kernel test robot <lkp@intel.com>
> 
> 
> Alexey Makhalov (4):
>    x86/vmware: Introduce common vmware_hypercall()
>    x86/vmware: Log kmsg dump on panic
>    x86/vmware: Report guest crash to the hypervisor
>    x86/vmware: Support steal time clock for encrypted guests
> 
>   arch/x86/include/asm/vmware.h | 276 ++++++++------------
>   arch/x86/kernel/cpu/vmware.c  | 470 +++++++++++++++++++++++++---------
>   2 files changed, 463 insertions(+), 283 deletions(-)
> 
> 
> base-commit: 7d08a6ad25f85c9bb7d0382142838cb54713f1a3

Gentle reminder to review this change. Thanks,
--Alexey


