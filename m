Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84B1377ECA
	for <linux-coco@lists.linux.dev>; Fri,  1 May 2026 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777674116; cv=pass; b=SRGXZ1qvvoTng577OHopsNVtvcqM7L8NxQokm0A7y32g3yEnaGbfY3BrHyt28Y12fNISsWJbfguhO0kwkzopaxDmmfHbdWyg+UPmlE/4HiH0Zwi3FOCDSsC/sdZoRRRcwNKfwInDcCe9VWfkxu6czUXfF1yIPDW+g38oMo2joDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777674116; c=relaxed/simple;
	bh=jLrfkaOhEb3MmFwOmWCGQPBbw6a6kIN8jleBSy0FvN0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/gqGr/zroXhcCuuCLhKqsn0YXwVI8/oBPedlOnKcZGlE83RlTyd5nZbnOI3seOGlhUzVdJ49Y6ddPpye98Ei3cDp+sKGcIdI3S33y92Py9qPzGckhCPwlUkX2I4Z/Y8oaSlPR1hXWMcPzeyBqJ5bATBQ4yOxqLee1gh2P+vOZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D/+zSvMY; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D/+zSvMY"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so793855e0c.1
        for <linux-coco@lists.linux.dev>; Fri, 01 May 2026 15:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777674114; cv=none;
        d=google.com; s=arc-20240605;
        b=DmxaKlxH1V+YOMQq1WvhOpgB37PqImJcPhIyEXxfGKNuUPMAjRnVXgVcqO/RCE/vW3
         Jh0uvtzckPJ4ALTK1aKQKI06aRRGanQ8R56MqRyEzASW5JCZESXUzWucqkROfyof+6SC
         DVIXHCdns2XlZNBfa45dBbvDsvxSzXsvSyDRvrJUmzGgZ3QOMHPT+JHWmoJLDQvAvzo9
         getVY1vapSjUnBh+bimqSRQb+PF7kijPbB+ZIezF8idUKbhY1WjRdvR/9QxMyzkbYzme
         +2ZWFfzXvapILWCm/4JTn8ih6Oxo6+a7iYhjaC97PozkMltfb2XcY5mg3SpbGdPtFcDf
         HGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dtXXiVGCKhisCk8aLdkBNg++qq/ezEnbK3PGbPzPAeg=;
        fh=qZrG15fnTUjl9n4UcHu8vdPN2UKaT1v/USFWuSrFMzg=;
        b=kWpBOsoLHcu7WBs4z4/wrcXOe8Ahn9sddMczuVahKtSSYes0HX24lO5Kn2fYO/vOF9
         sHndaZJ2cB6RQjnQO4rdlPRrBm03MUKkDbXQz/pb6qqafszYbAGe5pwMCcuywsT8qdEY
         pccZozQMoXQCRU7iZJQSdn0X4xAoIoURlrW3gpYndUarV0Sifn47kWwR3sdcJxKbGyCK
         bErfUabz8fEL94chUJQR9ZWiqkr/G2CLlv7L1RcK93SLendEUbLSl/dY9O6ZRjZgPeLH
         50MgoKhc6RKd+k8Jfawu0Us5k9kazWKf3BOt0ebra4trzcQW2asq9+UIq2N6CEz73ujq
         UhkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777674114; x=1778278914; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dtXXiVGCKhisCk8aLdkBNg++qq/ezEnbK3PGbPzPAeg=;
        b=D/+zSvMY2hsBUsb2vRpNYwX6dIMuwUji+mo1j+2OSIAtLltAcEFRFxU1D59gCgMSTt
         1X0mmHaWvdLyrHp5xkl+gXPXEDTyrjWmXTHJrAZd3A9UKK4CmcFNO56D9qVIS0x7XpOq
         +YRlQl+HbiDyfx9uWg0IP4RZP1C32UZ9cstoDs3NCile9RXvEfnXFCJGS1f2v6fvcQG9
         jC8p2EAwkY0vnBHQMy1j+FX6N8GdrBd8+9y/zK0tlRQ/XS/dpbJ2C1Sx7H33a75HSKZe
         dsofyO0JcXkfzSrfAhDbjXqe5ydLGmTQmOsUMya4RijAtyah8qopNNCHFw5b9Uw2itPy
         nPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777674114; x=1778278914;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtXXiVGCKhisCk8aLdkBNg++qq/ezEnbK3PGbPzPAeg=;
        b=CdcIlEXLvJygTzzDirOD04+g5PbSbPNLHqDiURICfevlf+4MEPdLy52mcn2t1LZKJ7
         twIi8Kz3gvXA+PLeT4/dAAjHUmt/HaraBsGjFUM4fKd0CIzLMmbTyWjzv06D67so/SW1
         ejekHh/7bmzRiCldhJz69Eob92eXQR1A6xBFzg8aK62Z64TLgnsroXQOWPEs2SX2QfI5
         +lmwoHYXY2120IHnAyz8hpWoGC2ZSkC3d0JsGrYeCPzKFGE72HHdQGdPjVblc7uicj65
         k4cYh+GMHiwVrr4AU1C9v8B6FMf/rO4X0HBmNZ4yJvKcJxh1VIdb75mPtFH6o2lNLC2u
         FdIA==
X-Forwarded-Encrypted: i=1; AFNElJ9GGE3z5Kwd2iM/60BjMhEHni5Whvm0xnX967wNPEu68wGySqE4iXqdq4B7XUwnGVdnl3fjFhX+7zkF@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+Gyn2tVi818p+qaAVAst1LPcYu3Ba5MVaMZcFtXXyrME589ZO
	sIgtMcQ4mQeg9tbtMr3WEdHb/+svmtZVBxUQ1ark50mR4dhikf0U1CENiWoVX33VGkBa7xOuSE9
	jiaX+Mt+9lU88u+7AnH6CrQ4zEgpC+QJpQJfTkL5h
X-Gm-Gg: AeBDiesFlkaJmCvN7uUX4hfPoUpjLzvm7scZqdkDUhBAu/SKKrhwMMo/+GuuO/eZ3Q/
	OTrg0p4kjbKFHpZnlCR9Q492rbjDwrFpeeOYTv/oo1rBztY7Njd/Ror8BGSkqe2rumaAf1z7MZH
	VZ//GXH9KY9Yqf+UC4UnoTiIygUicZTsRhGFR/s5sNuZfAMQNZbimfq2V+OFahWVvoZENI5Tqp4
	PhuTGfyJBv9x0UnNE9O2jr3mnMWA9uEie6yWgJTDQ0hu/hU4TSoxkQNiI9BD+w3yKKSAIXs8XEG
	ieaUrERJFqBBdJn6b+hltHRGtoTC60G5H2Be1fOU8JUgGX18ZjZ43+A6bs043CjiThvamEN9PHC
	8modYkAUXXyZlY7c=
X-Received: by 2002:a05:6122:1789:b0:56f:1c32:bd07 with SMTP id
 71dfb90a1353d-5750c6b46damr742606e0c.2.1777674113098; Fri, 01 May 2026
 15:21:53 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 15:21:52 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 15:21:52 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgHRpvsEjtr1A_Qz3d4oMEaffTxESavrZ73Jtt6OobCwhA@mail.gmail.com>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
 <x7n77snnvvukofo3slopl74c5tmlb2t2un5qy5fq6eb3d2xt7e@6a6tixg5mdfc> <CAEvNRgHRpvsEjtr1A_Qz3d4oMEaffTxESavrZ73Jtt6OobCwhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 1 May 2026 15:21:52 -0700
X-Gm-Features: AVHnY4I-FL7ow2VQuDyStuaACgF9aoh7fvjduqjprjOyhgxszANTKzDwmZOdoKM
Message-ID: <CAEvNRgHZJ3RONKBXqWWLu2f4G7FhAvsYY0iMowmHu7v-O+g=kA@mail.gmail.com>
Subject: Re: [PATCH RFC v5 00/53] guest_memfd: In-place conversion support
To: Michael Roth <michael.roth@amd.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	Jacob Xu <jacobhxu@google.com>, Darwin Guo <darwinguo@google.com>
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>
>
> TLDR:
>
> + PRESERVE == guarantee that the process of setting memory attributes
>   doesn't change memory contents.
>     + implementation == do nothing in most cases, except -EOPNOTSUPP for
>       to-shared on TDX, since unmapping is a required part of setting
>       memory attributes to private, and a TDX side effect of unmapping
>       is zeroing memory,

-EOPNOTSUPP will only be for TDX, not SNP.

> + ZERO == guarantee that the process of setting memory attributes zeroes
>   memory contents.
>     + implementation == memset(zero) in most cases. For TDX, a future
>       optimization exists, where memset() can be skipped for pages that
>       were mapped in Secure EPTs before conversion
> + UNSPECIFIED == no guarantees
>     + implementation == guest_memfd does nothing explicitly about memory
>       contents. The implementation is pretty much the same as PRESERVE
>       except guest_memfd won't take into account vendor-specific side
>       effects of the process of conversion. Except for the test vehicle
>       KVM_X86_SW_PROTECTED_VMS, where memory is scrambled.
>

Found another use case internally for pre-finalize, SNP, to-shared,
PRESERVE, which works with the above smaller scope.

During SNP_LAUNCH_UPDATE, when inserting a CPUID page, the firmware will
check that the CPUID values would not lead to an insecure guest
state. SNP_LAUNCH_UPDATE will fail with an error and the page remains
shared in the RMP table.

Here's the proposed flow in the userspace VMM:

1. Load CPUID in shared guest_memfd memory
2. SET_MEMORY_ATTRIBUTES(PRIVATE, PRESERVE)
3. SNP_LAUNCH_UPDATE => get error since CPUID was insecure
4. SET_MEMORY_ATTRIBUTES(SHARED, PRESERVE)
5. Read shared guest_memfd memory, error if VMM disagrees
6. SET_MEMORY_ATTRIBUTES(PRIVATE, PRESERVE)
7. SNP_LAUNCH_UPDATE => successful, since CPUID is now corrected

Does that seem ok?

>>>
>>> [...snip...]
>>>
