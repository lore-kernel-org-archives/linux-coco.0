Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E281A9F96
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 00:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782346791; cv=pass; b=VnUdOADYNt/DYTq6pf82sJmfxgJfsMrg7J99rFKs9b3JLgOESQpFnupj/E07O2DATfMUzUGiIC+KZrnlc9dKPgzVhOhat9AZ9tgK+48wnOtmlcGdusld1ZYsd/05QbLfO+AM6rsNZ4a58DRibRb5iQgT2utYK0UKfx3UqH+oH1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782346791; c=relaxed/simple;
	bh=rLzvOJxIQU3Ts0wS9KKJCuJPkhIJBlsf6U32nXubaQQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcldMCHh4Oub++B8+ez9NUjZtknknJjupH9jshEPFxci724UZ0vLXG4tVpRo7uwa8pAU5+zbloSgIyHbbJll2jco9BaZTWiQ9KyhvscEBy6rpE1CiiuFTTFZ6szHQzva6S7MyAJin8Ec8F8Ty+svp/W+gNlrT+5VSWdnWMHR3NI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QKxa4ECn; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QKxa4ECn"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-139986373b8so2266412c88.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 17:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782346790; cv=none;
        d=google.com; s=arc-20260327;
        b=Ja8T4fRaDIf5w00QTVA8sqR1KK4FlXZXf1Ea5qIC4hmin2dD/N67xnOFVqPNYArk/E
         IdX+5PQjNb9z/3pJRrgFHXfl0IJfhQtwRGIjOsAnOsi72Joj1nnnrkEGSIj70oitw0TE
         daJPzy/01QsTryGD5itE1a4U+GtFl56zajWFu3RSCvxKz8DLBbKrjSrZE/wzUBpVfyzS
         LLoZdC0fq9oaxSttjJpmgCtmbw4bSCeZM/QtekCfYHtjPJfJ3JIg4rdqgsChVN9/roKl
         WmgLkm+KOssJ1s0OZn6X1JNOtKbl9bIb1AUUcu0QkCziMnTmFsn8tGEByQe8x8h5OLkF
         FxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CdGA3bllvZfq9+oq5ATtnUq0c6NavELb8bI7ZCuFA30=;
        fh=p6f933X/U0Onnyqitwxql2eXFTxmHLVYh/a0fLJO3hE=;
        b=mM/ee17hlZzPZutMp4vysqahxEuAcpb7uqNcyrmJrMQgQ9h6hySoh57in8UEqxDcVT
         GIaq82yLp2GdH8yvKZSMeGTV34MT085ed4UK46M7ZjmTciGo3v2Uw6yOzWhl98G/4BVw
         JYlzt4yvsNJoivuV9U0qrR61YrqhmkcvC8CcK7TAsPwCb5X+RAPFyKv87+Fslgqtj4lS
         iQ1SjyioHbt1SE5ZzAyY9AzZbetc+zMUH/dq4wiDk5fDKSvKN8UH7a6s9Yc5YMd1WElC
         WAtSedTzm0Ai8RQn5yILfYf+jXi8zGxFsMhtAIYHl2hw4IKX19z60cex5sF6u8iUEeCI
         4FuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782346790; x=1782951590; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CdGA3bllvZfq9+oq5ATtnUq0c6NavELb8bI7ZCuFA30=;
        b=QKxa4ECnS1Cm5rdladMuU1WA3bpQjKwWaJbw/UIrzFZOvRqGv0pVAZ1tFgILA4ZJGu
         yDpLpjpLHC4V6V30PR4dCoK5QShECZy4thrE2XkVzTn7/ab0GY6P/zZfYowZK1F3v8K4
         uV22XBXlyTQhZw56qDNJlU8VU20mBqFi9YBj6UHuzjibpokAjh6avIPoq2orvvNGaMZI
         quYAyW4Jcy6GRd057SXnhfk9IyFM+fGb91Rw69XC0kuIhGreHkHsDm6df09Ph9f/cckM
         bEVlqeSHf5IFY7YKVK37H9VQYtPqJwdLqhot1iGEpJaeE5vGZcUp3JCD4nzF7HWNUhJl
         B06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346790; x=1782951590;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdGA3bllvZfq9+oq5ATtnUq0c6NavELb8bI7ZCuFA30=;
        b=cUJXgkKCTcFyYCqMFHSX+Jf7Ts7lArhxNpX2HfMI4UDh6xowkedVFIYnPF+IXk/91J
         VWaQzcGAmheCZNMHIuKvjFyLKKfFALDiJNKzpFSRB8MLo1miKQNPm1IrCP1eQxVfre33
         FEqZF6dic1ygaH8SkoO9RSrg8qKIRTHXayGKumTbMIzLBHYtCd+8ytgBgMBpXoLWfREL
         6RM93QEMFetI7WoOS72/npjkB2LAHHkyPJBWKt4hNcHm7uqruyT3hZ7fcep7vgGmyjom
         /qbRMrC9DLxHLUlVdGaLU4AXZMTfYqg/Cr1ysGO7JzSLMvEKKH54Ihvc1g4BWfaAloEQ
         2vkg==
X-Forwarded-Encrypted: i=1; AFNElJ+yos6PlIgaDQ40S4dpgzO8Cye2AfTLcIxCWvE0CM0+D2y9RDaqfgfmRqI1R9nfaGRsorF5ROUq6mwN@lists.linux.dev
X-Gm-Message-State: AOJu0YzYl9ybt1L7+0Z4XibXABSLWZGw14KBcckEIjKwtCmyPZu4vZ0a
	AfLHTyBB3dnvsMW80m79UXeMflaK3kiqMOuvgD/WH14hdv2zaIlqyMEFMUIZ4Y2uJiYx2fXA/G1
	s4xgcihbEGpFb9jmAa1Fr+nlCoGsjAaXCxpUCdo8f
X-Gm-Gg: AfdE7cmaUT3fqlAaHG/9nM/JoK/ZT+zsi9X4+p5yZeEK3O7o1w39g+LIr+PxM0sJWZ1
	ciqqD1+BG8QDG+EtIEPytd99lhi9Wk5j3YjUyYHglsLcDtvt0XNA7w3qdNa2UQ4az80Ap5I9mhT
	2XlpqfkuVTemPWVtJ9+HRB2S/AGAu+Yi1K2X9HZXdobdDZq03pOhm+bdPGk+P77DVVmHl8VQj1V
	ZP4IWCovWw333PEAJtofoZmZZHs0ukSlrcZlKdDZYs6bW4UX7JdtDCvtiW8F391xpbNjTAaVicZ
	Q2Gv7J6VSYb6ykAUt7uOvdY76lJ1ff7AErrjnzFCdSpZoMfbBKHSpUCwHUM=
X-Received: by 2002:a05:7022:611:b0:137:f001:fce2 with SMTP id
 a92af1059eb24-139dbbc564bmr255822c88.33.1782346789006; Wed, 24 Jun 2026
 17:19:49 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:48 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:48 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <9f81ea12-98c4-4ce6-a95e-233851dfe8dd@intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <9f81ea12-98c4-4ce6-a95e-233851dfe8dd@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 17:19:48 -0700
X-Gm-Features: AVVi8CeR8FAzeQAvNnM15yag_GxBRrpO8H44tlQVk9R637S1b27Bxjsp2TDXvkw
Message-ID: <CAEvNRgHR-6X72fvx-4s+RrsMHohSCBu53bVX4G3x-=XGLnOxiw@mail.gmail.com>
Subject: Re: [PATCH v8 00/46] guest_memfd: In-place conversion support
To: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>> TODOs
>>
>> + Retest with TDX selftests. v7 was tested with TDX [12], but the setup there was
>>    wrong. Conversions were successful (no errors), but the shared memory being
>>    tested is actually in a completely different host physical page.
>
> Glad to see you knew it already (I was going to report this to the
> original POC TDX patch)

Thanks for reviewing!
