Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3B52F7EE4
	for <linux-coco@lists.linux.dev>; Mon, 15 Jun 2026 23:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567198; cv=pass; b=ttg6nwY0TsWBh1zHOVC9oPDiqN09yC+v4wP6kj8SecONkVmJILiyX00X9Xmh5ooZmtA6GkbIrRI0eHq9JlNsVTkyHNmmdD8Cus39JI2X5hqYya3ObEfpLmSEK0swzCG+PIp2Apkp8vEESRSsdjgDS+SqVCHrzY7KH6CzGrvUiDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567198; c=relaxed/simple;
	bh=I+nWA545jB467TF+kyDxBRzn7JtAPzZzw87eodkUA64=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNRPblhoBMlP5QF9QLgEQP0gkSYOfRscuhEKYUei4AVs5fXweOzpHhxfVDNODSdyeXjGkVk1qEq3nKpC/YyZNta0tYH28QGvx9BVh2jbAQhO7Co09dlKongFake/YNHn9Q5UtZW2QkN3s70+5PFXwUuhmUxe1Aac2VtCCKBHxVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wge3IsSm; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wge3IsSm"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137eb0d76beso3281528c88.0
        for <linux-coco@lists.linux.dev>; Mon, 15 Jun 2026 16:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781567196; cv=none;
        d=google.com; s=arc-20240605;
        b=LadEqdfmahaFzC04D4qvH1jqm2otnU4n6NeCtMMp7ow+iarMPCz2i6J6cA/Iu7eX7G
         sq4Uj6C2upWfn6fG9Almph6XiAtuQplNO/BpVhsHk5WiKiNe/72QU51HyXinBRZKpegw
         9HdfjdBIa0+MywtVKIYeEt0kBlOSGsXRU4OvLDJfTKOgM9OudYndU/3OqOQ605uq0qcX
         NZMLHfVeIk8gqyP866vaVQq5Uxn2YAzqxV0LAu4Ajh8zjGZEfQkbs60nVpfUniwcCNJo
         UZUr0QdQWODz56pxeYfl1aaqIryVbjKVgBT3re3+8gRawU3OpE3P3SC25Jepa6ChnSdw
         TDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ObEUf0E9nYIpFpN+Yp639n4XU8L7FHa7f/UlfLhBApI=;
        fh=3hEP532QyXoPgKkT4Ki7ZbuSUF/OKhFcbKo+tk3TUzk=;
        b=DtXzlFn+1HuZ+1dCvlpNrQVFV5KG/2/8zgq1MZCPf428xIuggXshAAaI2zeQa2RM1p
         xdRuGukCE6xB2E1sM3W5fjQISXyZMEP5XXGnIdYAegTfx9sVS9NvGKpjS0Lw3q+0ugJX
         ik6aYNQ2jkYhUiuWNR0Jr+g02a5p6LbmGzHkxUmsEc1LBxJ27/E6zbu1GG/OK5KItM2/
         cvfDCkZXfzC67sgXBQ1WthXZXVl3JhXTsYNshJWx6o0pouWLk6ig6nCo+qodaGYp1xbF
         kbBRdUz0KYBDyhe4wo0qCpqc8DosIl7BFeErY/ZsBqz59gctcjRLyZcotWGzOhFmeaHy
         AzEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781567196; x=1782171996; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObEUf0E9nYIpFpN+Yp639n4XU8L7FHa7f/UlfLhBApI=;
        b=Wge3IsSm7cGo/yLy+JKEWRDMyPwzNatTLkh3THEk4crJ7XoTq6TgY/ATao8KARjtQq
         4hq7uYptaYblsL3ZuJKefxcm/B0X3uoVF//BBZrhflvH5zgCGjorzIqIH9HnE0L+sm/G
         Yvwa0CbVv1hiWGAKhhzLCjw2uAPlfpPBKRAeWRGEo+bzaBXB4/xxHrQ3gV5Rg0z/h/lm
         iLPyzm8NTShE44hcSqv1pTzs8NYrhKiz7o1eFAB3ffKhx6wwKtTwAckU/L9bYaAgyvBS
         f9UisL+unECVxwChOMi602YvBOTPN6Gzze8CEwnr9OIc0AvtWbftHUPmEdBSwrrBtELB
         6q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567196; x=1782171996;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObEUf0E9nYIpFpN+Yp639n4XU8L7FHa7f/UlfLhBApI=;
        b=HXcwYV5xy6i1IHeL5PETeOzPBQJ7o3kjM3/OYSzcuDeXX2YSD20n32hmQW3usQAihk
         7hAEV03xLUyBWNu7Z5bjfRIeeRpIr45U9nVmy3Wf3I523lEOLzvzXj/NcU1FnJSoVluJ
         Rla+xYMsMCO+YF7lh02KhSSd7Zdtzx6g9r74t1Z/+vTt3Fy8n9NLutRIUOdSOhPt64rY
         WotSdWJ9K/Tikmvip6qSptz+pIKlS+yokT3YVMlpo3pIc3CGJy9buKBeJKZMwYJY7UFc
         mGwcAPwH784SG2pj4Q5KjM3kaHj9pKJOPcnZij7NYcGhZP/RFPwYitjQ7I4fOzyfgtD9
         b0tQ==
X-Forwarded-Encrypted: i=1; AFNElJ+O3VkdFUJnge/M8LdoUWH2ZCtDicT3hkDP6wAlYFb1GNwSF2xgZzkKxw1c5odtn1kPQmWsrxHHOZsa@lists.linux.dev
X-Gm-Message-State: AOJu0YxT7dNjkDmBXo540GbLQt91/YZfuCT3TH1DN+hyhoXRfj+EbXxE
	G6XUxjP6cJDWzhtQaQlIetzLy6MG8fxV71NfCmQZkof+GJ41Q/a4lW0JrK8ZpDj9xi2cMGlS1X5
	6hPvC8ruzE25C0JxZ8SSE2uMVoJ+5AH8ujbRiM2Fs
X-Gm-Gg: Acq92OE71VgUrCsAIsAavusp5nLZPPcay2rpkfbJeUEp7pmsKjkQdHYQ/4DuQMnAvXR
	QkH9a/9KL6UuEHf1ebOUpC5UByHCIAcSujVEn6SaxHlm9wAC8ag11stl63Pa8cCYiH8rhRL0GEF
	I5qWvgDxKi7cFFxnDFXbXD21REKSzdG006raQO9ep32pEBERLOrXu8ymaHzot4Mb37bGFmS5sP+
	in2KQ/+H4q3YuF2/Ty7Wso7RwtXBpdhqtK4D0RUpOp6vVZE6OEkVRdlBval5lKomXl1Tok9k5/L
	XZdcjY4XX4zbdgUBdRNFIL1uQUGRfHzVjgxhwOg7GEb/nQM1S699HBYQ6KCZOCAmu4ix
X-Received: by 2002:a05:7022:689a:b0:138:40b4:6cf9 with SMTP id
 a92af1059eb24-139858102f4mr725236c88.19.1781567195936; Mon, 15 Jun 2026
 16:46:35 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 16:46:35 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 16:46:35 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260521-tdx-selftests-v13-v13-13-6983ae4c3a4d@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com> <20260521-tdx-selftests-v13-v13-13-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 16:46:35 -0700
X-Gm-Features: AVVi8CfMUcsxFfG3l14C_ZxMq1_qiC853xZ-90KAH7coZFexwbjDcBX_tp12FV4
Message-ID: <CAEvNRgEBiivp9tOHZnFmWvF6ek-Ar-m2B+hb=-H0dgAcM2=z8Q@mail.gmail.com>
Subject: Re: [PATCH v13 13/22] KVM: selftests: Set first memory region as
 shared if guest_memfd
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> Set the initial state of the first memory region as shared if it is
> backed by guest_memfd, so that the KVM selftest framework functions can
> populate mmap()-ed guest_memfd memory the same way memory from other
> memory providers are populated.
>
> For CoCo VMs, pages that need to be private are explicitly set to
> private before executing the VM.
>
>
> [...snip...]
>
> @@ -495,14 +497,16 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
>  	vm = ____vm_create(shape);
>
>  	/*
> -	 * Force GUEST_MEMFD for the primary memory region if necessary, e.g.
> -	 * for CoCo VMs that require GUEST_MEMFD backed private memory.
> +	 * Force GUEST_MEMFD for the primary memory region if necessary, and
> +	 * initialize it as shared so the selftest framework can populate it
> +	 * exactly like other memory providers.
>  	 */
> -	flags = 0;
> -	if (is_guest_memfd_required(shape))
> +	if (is_guest_memfd_required(shape)) {
>  		flags |= KVM_MEM_GUEST_MEMFD;
> +		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> +	}
>

Just noticed this while hacking some SNP tests.

> -	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
> +	vm_mem_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags, -1, 0, gmem_flags);
>  	for (i = 0; i < NR_MEM_REGIONS; i++)
>  		vm->memslots[i] = 0;
>
>
> --
> 2.54.0.746.g67dd491aae-goog

I think this patch should fully buy into in-place conversions, so we
need to also set GUEST_MEMFD_FLAG_MMAP:

@@ -483,6 +483,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape,
u32 nr_runnable_vcpus,
 {
 	u64 nr_pages = vm_nr_pages_required(shape.mode, nr_runnable_vcpus,
 						 nr_extra_pages);
+	enum vm_mem_backing_src_type src_type = VM_MEM_SRC_ANONYMOUS;
 	struct userspace_mem_region *slot0;
 	u64 gmem_flags = 0;
 	struct kvm_vm *vm;
@@ -503,10 +504,16 @@ struct kvm_vm *__vm_create(struct vm_shape
shape, u32 nr_runnable_vcpus,
 	 */
 	if (is_guest_memfd_required(shape)) {
 		flags |= KVM_MEM_GUEST_MEMFD;
-		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
+		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
+		/*
+		 * TODO: Clean this up together with vm_mem_add(). Use
+		 * VM_MEM_SRC_SHMEM to tell vm_mem_add() to mmap
+		 * guest_memfd with MAP_SHARED.
+		 */
+		src_type = VM_MEM_SRC_SHMEM;
 	}

-	vm_mem_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags, -1, 0,
gmem_flags);
+	vm_mem_add(vm, src_type, 0, 0, nr_pages, flags, -1, 0, gmem_flags);
 	for (i = 0; i < NR_MEM_REGIONS; i++)
 		vm->memslots[i] = 0;

The VM_MEM_SRC_SHMEM is a bit of a hack but imo that refactor should go
with another series to clean up vm_mem_add().

The above code was working for TDX because vm_mem_add() without the
guest_memfd MMAP flag would leave region->fd as -1. Without
setting src_type to VM_MEM_SRC_ANONYMOUS, the assertion in vm_mem_add()

  region->fd == -1 || backing_src_is_shared(src_type)

would pass.

tdx_init_mem_region() was called with the anonymously mmap()-ed address,
which turns out fine.

With the above change, we would also need to call tdx_init_mem_region()
with NULL for source_address.
