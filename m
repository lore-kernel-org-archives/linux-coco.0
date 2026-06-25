Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8793328FD
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 00:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782348125; cv=none; b=EyPSwjzYMm9AcCUb8YVbcKhyNzvF/JoOPsakOOKf4if1PW1PKXb3iFCE6xThclhix3zTF2LS+//sRAzyeNT0L05LPQvHlrDnsN2bXmzG+EWOWuXz/l7egcleANLZuWrypLk/ZNRNZHB5nPv5jUzwzEAbza+20K2jwAa+W0E7FNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782348125; c=relaxed/simple;
	bh=YB5GE7E3Xs7izwgjr3ob/9chSpyxHi2CWbqKKsIl2LU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sT0N6zU4FTL003f4VIDmzuCcPum5D4hDvwUUAYNF5dR4bqIMRwtmO5Eti/nHN4cLeocLPfgo//T6eoZ+rEjgAZ5vOt4zY9ZN48hwh+nyvieuEZbMXvNk5R9PjQnn/HN5FkDYclKjTYgxPOUHijoMgRHbOAHVouWP0KLxJMGTxIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GiWVoPjh; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GiWVoPjh"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c8923722247so1898058a12.2
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 17:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782348120; x=1782952920; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4DFjavBCbzblLm5XoFLaw3Sc1sbInL5uPLu8y3/D5AM=;
        b=GiWVoPjh2Py4GBjOc0B1GMQ6v8DrtPGhrN436wVyJ1UknL8XzfR+OfbesMvZDt7kpl
         zXMhuAOx4/txmuXO8J93NfG89jzpTRp7kZtKOtteOAHuwN/uQXcZHP3XMgnj/4bALifu
         J/HWMKYwxxaQfYchpqGwD7NkGUrJBADUl93Y4Vtke5qhHleQMXNCp0CJY5vFles9FRqa
         BfLzB+2GY3XoULDZaM4ipR3GzaEPjYJOm4chMKddRw6g5Wws3qHKOdgQSENdqGZLfCQk
         zKp4q8u9n/+SuS6f2tlIYRRqN+fGv/lPP6L85+Vwr9Rlaagc0zJBQTmlSntT3FfMGilC
         Ur0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782348120; x=1782952920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DFjavBCbzblLm5XoFLaw3Sc1sbInL5uPLu8y3/D5AM=;
        b=NHySBrFeFV7mO75L+PW93j1K6o2FJPk2B4M9fzDmYqPjtu+nQYujZOIfnv9feJWFhX
         E/PK41KKx+YHuszqm7EMWv42+4a+j0leMWKUsLVGpQ7jZj8b2izfEwxoXgAJ1LfRawjU
         iATUnSo0WltYsSYY86EJhY5UW1jOsCiGSrUQ9hpS3VcO/h+TgOk0S8ZXW36C1CkTUenV
         C6qJ+O+EDndsNUqXlf0c46XXqGjo9Kq17zryWInqHevs3nAhKGxHv/KPvH14HaDTtslf
         wUhno0Jp8K+sdEd0wCWN8pWsqQHUT9BGPy/PPgwaAXu06AuLG8RvdLVISSnoKbhjwXik
         yXAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8z9OUtkCxDGY2kD1/mCWnQKjE+Z+UZbEpJPS67B5Az7BkmY0VVVgKu17B8RuCG9vwYKqeVkuX/dLse@lists.linux.dev
X-Gm-Message-State: AOJu0YzrtqyY9oYueNBDaPRDwLkfptGahn2cv+RAKQN4jsCjfrCjQmWT
	+r3ntDhpn93JKtT7uBbav2s4paxrTqdNZz/ZBfbM/0zr4+w7WXz8CNpkmjyCE40WR+Js9WMn+sO
	QDPP7Cw==
X-Received: from pgbbo12.prod.google.com ([2002:a05:6a02:38c:b0:c80:296b:72cc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7fa3:b0:3b4:8bc6:138
 with SMTP id adf61e73a8af0-3bd4ae9cd56mr397852637.23.1782348119218; Wed, 24
 Jun 2026 17:41:59 -0700 (PDT)
Date: Wed, 24 Jun 2026 17:41:58 -0700
In-Reply-To: <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
 <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com> <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
Message-ID: <ajx5Vrz9ma--hrGH@google.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 24, 2026, Ackerley Tng wrote:
> Yan Zhao <yan.y.zhao@intel.com> writes:
> > With gmem_in_place_conversion=true, userspace can create guest_memfd without the
> > MMAP flag. In such cases, shared memory is allocated from different backends.
> > This means this module parameter only enables per-gmem memory attribute and does
> > not guarantee that gmem in-place conversion will actually occur.

KVM module params are pretty much always about what KVM supports, not what is
guaranteed to happen.

  - enable_mmio_caching doesn't guarantee there will actually be MMIO SPTEs,
    because maybe the guest never accesses emulated MMIO.
  - enable_pmu doesn't guarantee VMs will get a PMU, because userspace may elect
    not to advertise one.
  - and so on and so forth...

Yes, there's a small mental jump to get from "KVM supports in-place conversion"
to "I need to set memory attributes on the guest_memfd instance, not the VM",
but I don't see that as a big hurdle, certainly not in the long term.  And once
the VMM code is written, I really do think most people are going to care about
whether or not KVM supports in-place conversion, not where PRIVATE is tracked.

> > To avoid confusion, could we rename this module parameter to something more
> > accurate, such as gmem_memory_attribute?
> 
> I asked Sean about this after getting some fixes off list. Sean said
> gmem_in_place_conversion is named for a host admin to use, and something
> like gmem_memory_attributes is too much implementation details for the
> admin.
> 
> Sean, would you reconsider since Yan also asked? If the admin compiled
> the kernel knowing what CONFIG_KVM_VM_MEMORY_ATTRIBUTES means, then the
> admin would also be able to use a param like gmem_memory_attributes?

No, because it's not all memory attributes, it's very specifically the PRIVATE
attribute that will get moved to guest_memfd.  I don't want to pick a name that
will become stale and confusing when RWX attributes come along.  The RWX bits
will be per-VM, while PRIVATE will be per-guest_memfd.
