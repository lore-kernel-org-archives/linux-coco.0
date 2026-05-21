Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216F13D3CED
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373305; cv=none; b=NI2UUa0LtUPbHkftvkiRucPShpiQ/2XODEQt5uvIyBlZ1dl6YHcqErQp2xOvsKL7jD6e9DAhj/nc/Sac4qRhKUPLIM2AWaD9jh/29j7TJT8SzttiuVXnwAZofRhyQ+YBR4OKvOXA1Vb0B8JHFESm2vq/gyiRl9XlFSo2F1D51Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373305; c=relaxed/simple;
	bh=+pL+rZ5hYnakVp3eViVhhlNGbB7Zs5h4PZn9WwK7upU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rvU9WBRo5Cb/tbZtFAEhFjoeTUDeXVfBa0nqPxwKGTmr97Zpbdm3jbxFcBRFNLpir7q4GTMxkNeEnc/fm1evbEnHpug/MWUqH2QrXO/hx1Yhhtd8DjQVMhAXY4ApyzPZRGa5CaqxzrS6K2Q8QmeIiqIoFd95AdYTg44OpRhHbe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MK8Isd8m; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MK8Isd8m"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36865d109dcso5820592a91.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779373304; x=1779978104; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Q5oVYYRVy83rEvyTZBhLaKBIsxHN0wptJNVngW/2MQ=;
        b=MK8Isd8mD9VrkyjEjP6OQohy2g9wVBFL5qoUGhLB4lG/t9+vO54U90AvwuvVeHVZU6
         YzjjJrM/igHsbpoJ9q9Uq6LeV3lPlRX7TROxDrJXtkRd5MvF4KzyrG+Tt1mkesGLpKn3
         tjAAncZCX3DGAQUVLj70XKV3s8i3U6EWOf3yM1JiqilCqz1TaLKx1ULnzAJemuiJAA1W
         zGZPqscJZjSBpdpdHkvbIX0q7/Ly0irKgRkFaXGmwLAjXRnywENeD/brx0swqO/9uMgS
         A6iHKuAVdFFLn17/hJz4epcddjCdahxYYV3sa8p0jqe9a4PxAa07MnSym+YRDb5O0i5k
         7s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779373304; x=1779978104;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Q5oVYYRVy83rEvyTZBhLaKBIsxHN0wptJNVngW/2MQ=;
        b=ZlGzYt5ZKYvGsprUKh1sGM7Mt2TqE4juVaxTbqg87+QmxZsy/pyt0PR9vuSm8dfSo8
         08qjUjO18xQ4XudVipLAD0Gx+czT2PXejnvE0ONmRvKa0OloxkGSZKgNaWy0GhCp4LjJ
         DkVaqhLFjybbFFdHPEcG3LiNTflEd2HZvR+bNCGoHKfG5jK7suUXdVKxKPFQNOViMsEr
         PJrZRu3OIVkMt7mosC1dGfZCVovRwMxtpRfo1hC5dH7kWVkMGo0Vn8yl6VlZjCr1uv98
         28T6EOK3W5rTde0xaR6eNmKHfIVSVA2K7IJEuroH2Wuu8JU5QH8BMqSWe7WJctyP5G7d
         OSBw==
X-Forwarded-Encrypted: i=1; AFNElJ/Ix2cjFcnk0DWmET98IQNAn6FNICwFaaIUflKj5G/qNTz2l1lGOtIUh8azKpQVjSxt0cwr1XqMtM1C@lists.linux.dev
X-Gm-Message-State: AOJu0YySfGcNSnzACR2MydSJRdiT+ySsdpj+O7Y6I4kmNPErDeERGAGl
	MdQw+oSK0eqX1OZ5DQ7V3KfZ8r7HHo+xf9h+OXwL2EFGn3skpBbUgPxy8equSc/i9+G2tu7bszN
	G9/ySgw==
X-Received: from pjjj1.prod.google.com ([2002:a17:90a:601:b0:368:adeb:4994])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2548:b0:35f:b5df:453
 with SMTP id 98e67ed59e1d1-36a45630166mr2922293a91.22.1779373302968; Thu, 21
 May 2026 07:21:42 -0700 (PDT)
Date: Thu, 21 May 2026 07:21:42 -0700
In-Reply-To: <CA+EHjTzu=28Sr3=9A9LmJEGz0tBEDbU9taznVV5kdL7s8Nw=Jg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-19-91ab5a8b19a4@google.com> <CA+EHjTzu=28Sr3=9A9LmJEGz0tBEDbU9taznVV5kdL7s8Nw=Jg@mail.gmail.com>
Message-ID: <ag8U9qIcTd_GykHE@google.com>
Subject: Re: [PATCH v6 19/43] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, May 21, 2026, Fuad Tabba wrote:
> Hi Ackerley,
> 
> On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
> <devnull+ackerleytng.google.com@kernel.org> wrote:
> >
> > From: Sean Christopherson <seanjc@google.com>
> >
> > Make vm_memory_attributes a module parameter so that userspace can disable
> > the use of memory attributes on the VM level.
> >
> > To avoid inconsistencies in the way memory attributes are tracked in KVM
> > and guest_memfd, the vm_memory_attributes module_param is made
> > read-only (0444).
> >
> > Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable, only for (CoCo) VM types
> > that might use vm_memory_attributes.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> 
> Config files always confuse me, but Sashiko might be onto something:
> 
> https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=19

: Since this prompt does not have a default value, will it default to N
: and silently drop KVM_VM_MEMORY_ATTRIBUTES during configuration updates
: like make olddefconfig?
: 
: Existing userspace VMMs that rely on the KVM_SET_MEMORY_ATTRIBUTES ioctl
: for TDX or SEV VMs might fail to boot if the feature is unexpectedly
: compiled out. Could a default y be used to preserve backwards
: compatibility for existing configurations?

> I think this partially goes back to commit 6, the one I flagged
> yesterday. But also adding "default y" to KVM_VM_MEMORY_ATTRIBUTES?
> The default value should at least fix this issue, but I'm not sure if
> it would cause other problems...

Hrm.  As much as I want per-gmem attributes to be the default going forward,
silently breaking existing setups isn't great.  On the other hand, I'm *very*
skeptical there are any SNP or TDX deployments using a distro kernel, so I'm
still leaning towards forcing the issue and turning per-VM attributes off by
default.
