Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094BD43B3E4
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752403; cv=none; b=cTDR4AsC/oMFiY/NuoHBuQXr3f2ipF1hHwOAopH2iiW9N0YEWvD0bAHEa4Tjx+BEibSi5Yi6+psm/fsU2JLXsaKQ42PDuULejkxSVu9IVWe+joq69s3wpZROIOuUUISOtYc6zWYigP3JeUolCQ6qKBurwUH9UOtYHZb6HYGbsoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752403; c=relaxed/simple;
	bh=aKI/UKGte84OVTfWfIAvvMaWsDxT45eGHGOViohEC78=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cze2Yqhb3UqSNtFdrwlL5h75ViB5HpVeeSlYpsouq48PHC739xbvT3Zwtm3EKHzGKcEw0pj+1mNiyHsMzTvvTlemErXaAExHbcViDFYVhQqGh8eBK5JZDmMMivrqWO2e74tkF80E52Z9aJ70e3r1DE7bvjGJGSgIrkzVTGyGWys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bzlDXAsg; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bzlDXAsg"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so13729955ad.2
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787752391; x=1788357191; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njsQrhr1Rw86G3MMqhXpdm0dYelYnqk43kJ0tkWzOHc=;
        b=bzlDXAsgKaAx6LKlmzvYApcmGHkTDZ0S0NF+HPWgxoNpFQ+lYUsFrRgeuKUD2C8GDg
         OkQB/hbZ3jQashXXnadAm+nTcn3jQ7X6KzfP+yKbslUC56Nx0c3wxYGZWL4JZIosxujr
         NEGWAAzGDkqdxNfg/mApHWK3jL5g1+KitraL6lqWi1yoWtt8RTO36VwjqX5K7KHBKb+2
         Epke7X7vW9Tsm004OXQdWXLDH0c9YvlfqdZsMGRq4aeVbrEGNxuaQXBC34H4at/dczu0
         vVv+QPxbG0RVbi/JBa6mzz3+u+0PiU5vl7fgyNVkZa4e5PpzgHQlynQ/Kmjr+BD1EtPi
         Z+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752391; x=1788357191;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njsQrhr1Rw86G3MMqhXpdm0dYelYnqk43kJ0tkWzOHc=;
        b=KsSQDGPFJdMto7Gs7mvj9hZ1MUd8rcqn5svV+ih/sZX1NvCkXtJ5i7WXI2xGjJUa7U
         lt8RNjGIRQHhBF9FBQSBHMmtsuakq8ZL5z8R7BOqrLSmG+7mVD1DZbn2YD6MkmOkgMic
         G9pV8yzVXn00Ty4hn3W84CA6eEJi4H/WTjfH0XiO5GetlxEeBHGAZ/s09TgSifldaW6X
         2GoX3uXRcw3hMK4BMeUsrZ9Mi9B4hjIuByeAH42fpgOn1QZRaG5vADwUrcJtmo3Wk3fP
         AMcJEZsoKZymlxP4y13E4zGw18DeiJ221CHw3/gVbZYyZOoFoSbGMqB0+WeV8dV8mRQK
         0Hrg==
X-Forwarded-Encrypted: i=1; AHgh+RpHCUQY0F9aYBROUzbvsQ+wTvJv2uURjO8t3PQ0Qv6kySDNVFN5D+lORMWY46GirG2evvSaxyvN2c2m@lists.linux.dev
X-Gm-Message-State: AFuF++lqaAt0qp9Z0H0RnV6apSVhqEHdL7UxQAdLwraAy/kdWsjdKHAp
	6v9+xnZ1YMH5c40yok8JXDRHbLxggybxuuY8JrDbduBcD6IuJOZPpwzjY8uzVdfqSC4vWxigY+d
	n/+Tiww==
X-Received: from plnn1.prod.google.com ([2002:a17:902:d0c1:b0:2c8:1ded:d061])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c40a:b0:2d7:1bfd:b240
 with SMTP id d9443c01a7336-2d71bfdb766mr27401015ad.4.1787752388141; Wed, 26
 Aug 2026 06:53:08 -0700 (PDT)
Date: Wed, 26 Aug 2026 06:53:07 -0700
In-Reply-To: <CAEvNRgFXJbV78ktsg=b4srFp1OFjtQWQGuNPjr_MmWD-wOvjgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-9-2fc18ee6d3ba@google.com>
 <13ca60c6-e154-4397-8092-09f861e90fe0@kernel.org> <cbf5f7ca-a960-4fb8-a760-2d2794eb6864@arm.com>
 <CAEvNRgGOyQHnF_b8dk8E0d7_=CcwXtYUdU3ko7Qbep+_O7UC0Q@mail.gmail.com>
 <aoZZMQ3Uc8yQWPNA@google.com> <7eba513d-cdae-4832-abac-038dcdd88517@intel.com>
 <meww2a2uf3yeevsfpicyrlg3hch2x4bsdqv2lsv3vfjxg4qzes@co5eogmhkxrk>
 <ao3lOu8-wpGTs2wd@google.com> <ba8d0441-b52f-4357-b2e7-1e352aa385a2@intel.com>
 <CAEvNRgFXJbV78ktsg=b4srFp1OFjtQWQGuNPjr_MmWD-wOvjgw@mail.gmail.com>
Message-ID: <ao7vwx3nMqCjCHZU@google.com>
Subject: Re: [PATCH v10 09/41] KVM: guest_memfd: Filter both shared and
 private when invalidating
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, aneesh.kumar@kernel.org, liam@infradead.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 26, 2026, Ackerley Tng wrote:
> Xiaoyao Li <xiaoyao.li@intel.com> writes:
> 
> > On 8/26/2026 2:55 AM, Sean Christopherson wrote:
> >> On Tue, Aug 25, 2026, Michael Roth wrote:
> >>> On Wed, Aug 26, 2026 at 12:13:47AM +0800, Xiaoyao Li wrote:
> >>>> On 8/20/2026 9:32 AM, Sean Christopherson wrote:
> >>>>> And vice versa, a PUNCH_HOLE on a SHARED gmem (if userspace is
> >>>>> using an INIT_SHARED gmem for the shared branch of a memslot) could invalidate the
> >>>>> PRIVATE mappings (of a different gmem instance).
> >>>>
> >>>> I'm wondering now how this could happen.
> >>>>
> >>>> the requirement for PUNCH_HOLE on gmem to trigger mapping invalidation is
> >>>> the gmem is bound with the memslot. But how can a memslot bound with two
> >>>> gmem instances?
> >>>
> >>> I think this is for when userspace uses an mmap'able guest_memfd instance
> >>> to handle shared memory, and a 'normal' guest_memfd instance for private
> >>> memory. Each instance is bound to the same memslot/GPA range, and
> >>> KVM_SET_MEMORY_ATTRIBUTES handles switching between the 2.
> >
> > What I didn't figure out is exactly how the two gmem instances are bound
> > to the same memslot.
> >
> > The case I can imagine is
> >
> > 1. create gmem1 with GUEST_MEMFD_FLAG_MMAP and
> > GUEST_MEMFD_FLAG_INIT_SHARED, and get fd1. mmap the returned fd1 to get
> > a hva.
> >
> > 2. create gmem2 to get a fd2.
> >
> > 3. call KVM_SET_USER_MEMORY_REGION2 with KVM_MEM_GUEST_MEMFD flag. Pass
> > the @hva from 1) to 'userspace_addr' field and pass the gmem fd2 to
> > 'guest_memfd' field.
> >
> > However, with this case, only gmem2 is bound to the memslot while gmem1
> > is not. Following PUNCH_HOLE on gmem1 doesn't invalidate any mappings
> > because the f->bindings of it is empty.
> >
> > Do I miss anything?

Oh, I misread your question.  You were specifically asking about a PUNCH_HOLE in
a SHARED gmem instance over-invalidating PRIVATE mappings.  You're right, that
wouldn't happen because the invalidations would come in via mmu_notifiers, not
from KVM.

> I think Xiaoyao is right about this, the "vice versa" part is wrong,

Ya.

> Is this just a case of user error? That with gmem_in_place_conversion,
> userspace should not use userspace_addr from something other than the
> gmem for the same memslot?

Yes.  It's not just invalidations that will go sideways, KVM accesses to guest
memory won't hit the same physical page as actual guest accesses.

Huh.  But that isn't strictly guaranteed, because userspace could bind to a
memslot that isn't configured with GUEST_MEMFD_FLAG_MMAP, in which case SHARED
faults will go through the VMA, not kvm_mmu_faultin_pfn_gmem().  It's a bit early
in the morning, but off the top of my head, I can't think of any reason we need
to support such a setup.  If userspace really, really wants to use a separate
mapping, they could DELETE+CREATE an equivalent memslot without the guest_memfd
file descriptor.

So I think we should do this?

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 9c2d52bdf25e..86f53e53a136 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1013,7 +1013,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	 */
 	WRITE_ONCE(slot->gmem.file, file);
 	slot->gmem.pgoff = start;
-	if (kvm_gmem_supports_mmap(inode))
+	if (gmem_in_place_conversion || kvm_gmem_supports_mmap(inode))
 		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
 
 	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);

Regardless, the key aspect of all this is that in-place conversion is brand new
functionality, so we don't have to ensure backwards compatibility.
