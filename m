Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0AA471418
	for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663823; cv=none; b=h2Aah9fgLD7HqiO+wwisp02vDWu2FPafgss1i6p3DEHyJi7xlA57ARQRlZYGN8h10FEGPJwP26STQBgk+ugA7dmzsqLLeyQxHs1bh9pY67w/hjSpzZNA/RFgJuyXr1+vSnRogNzj/byTTj++w11SW7jTpjzHmhZ1T4XcYfuEN2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663823; c=relaxed/simple;
	bh=BSwRnMlp3n1hal7k25J47rSepqHeT4zWv8jN7OwIqO4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gKHgUNpySBML+TWaat7iupBzPR6EHWcUp/43Sei+XEoml5AlWqmSO5jtlM4KBczAL23eq0Qx31FjaSWZR9MJd8ConBYPuUuHuAHJjw6c7CNsghy2TZxjwTOzg8OjcIhU4RwJ+hBI4q74BwtSma7LFspsS0Ws4bxpXbuCV2eQvNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AeK3UQyu; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AeK3UQyu"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedf6e8a42so5736199a12.1
        for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 06:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787663821; x=1788268621; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1TY/LsmF/8fTytR1pzHURVENGerwNjh4wp6cPecJpZ4=;
        b=AeK3UQyu6Tc6DDY05gwi4M6GwRvq3VUDlsR1IopqKytOhw8VJR3rkilz2PUfuqJIcY
         s4M5sUokapNwddjiuD2jbg/D/4lSuUrZ7rutoriG1BHAbKCQ207O2QN8pcAO+xJ/3kwq
         YzaeOLn5UEAUqEHt0VRcluiiiHk9URAh1s54lDHENoIadUnu33SP/6c/+qU0qkVqJ8Ou
         Hdyz3pFbcFwKJdysf+JsimslHgwNYEP2P9Ma3v04zCd8NxS5v2CchzmWvH9PkNazecjQ
         u4EvFHQBPDhFPp+HvH27OBPYS6Ef8bWH6MKHiZZLm2UsgtFAMExDQZYuvnPrhv2fVi47
         kNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663821; x=1788268621;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1TY/LsmF/8fTytR1pzHURVENGerwNjh4wp6cPecJpZ4=;
        b=fEj2a0W/hac1/bO7/EWwy4+Bif2TwWjtNRbD/Zb/jtv4C0KhYWYruBhpUjPxuXJBaW
         g8jQweUVNk2+17iJfepjwJCybYMosMaVoP4i15T6lL0juHkHu1y0Uz3VF7NQTUP97mR2
         RjZX2c6wRiEefThnhNcqMktryt2xArw7/3qz67LASVSYtQgJHm79tDcYY63qoAQvsunt
         a38ytrEfjwhz55ndYkXurndj9GvE1P2B1wEmNyWFoszYOCgsjpOTMlivzXhrBb9X9TrG
         IhcElcKFIWmsutND1ALDSzlNIQi1xCO8L9mzGlnorlrfWxgxR92QScNOA0w1DFJLeOV3
         iKCw==
X-Forwarded-Encrypted: i=1; AHgh+RrdVD/ab8/rdn17v1acNfcrD/D3jsZIFtgLZ2egHrJzLZPd+si65ilCEjF82L61aOoFUt2/qWyKMCBs@lists.linux.dev
X-Gm-Message-State: AFuF++nB8U+xeuJ6xlOE1fZb1BLEZdWjP2kwaJNt0BzzYcaunXle485U
	gdamr673EDZrC8F1TvhzlDAjENo3Zguma801B036vK5XItSR8GCaIoAKtYLBSjk0OcxbYze5Idf
	XlDBlqA==
X-Received: from pglx3.prod.google.com ([2002:a63:1703:0:b0:cc1:517a:d25])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:600c:b0:3b4:61f:1fec
 with SMTP id adf61e73a8af0-3cd2fd8e339mr71904446637.2.1787663820348; Tue, 25
 Aug 2026 06:17:00 -0700 (PDT)
Date: Tue, 25 Aug 2026 06:16:58 -0700
In-Reply-To: <5f7b62a1-957b-4a43-9a16-d06b3f916e84@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-9-2fc18ee6d3ba@google.com>
 <13ca60c6-e154-4397-8092-09f861e90fe0@kernel.org> <cbf5f7ca-a960-4fb8-a760-2d2794eb6864@arm.com>
 <CAEvNRgGOyQHnF_b8dk8E0d7_=CcwXtYUdU3ko7Qbep+_O7UC0Q@mail.gmail.com>
 <aoZZMQ3Uc8yQWPNA@google.com> <5f7b62a1-957b-4a43-9a16-d06b3f916e84@intel.com>
Message-ID: <ao2Vyjzq9wdYzQPr@google.com>
Subject: Re: [PATCH v10 09/41] KVM: guest_memfd: Filter both shared and
 private when invalidating
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
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

On Tue, Aug 25, 2026, Xiaoyao Li wrote:
> On 8/20/2026 9:32 AM, Sean Christopherson wrote:
> > On Mon, Aug 10, 2026, Ackerley Tng wrote:
> > > Sean, do you know if looking up attributes in gmem to feed the KVM MMU
> > > the smallest set of pages to zap will improve performance significantly?
> > > Or if there's any other reason to do this lookup (more complexity in
> > > gmem)?
> > 
> > While working through this with Ackerley, I realized this patch is buggy.  When
> > in-place conversion is NOT supported, then as evidenced by the current code,
> > invalidations are guaranteed to only affect one of SHARED vs. PRIVATE.  And if
> > we change that to zap both, we risk overzapping.  I.e. it's not just the cost of
> > the extra MMU walk, it could also be a functional bug.
> > 
> > Specifically, if KVM zaps both when SHARED vs. PRIVATE is tracked per-VM, then a
> > PUNCH_HOLE operation on a PRIVATE guest_memfd will incorrectly zap SHARED mappings
> > that have nothing to do with that gmem instance (because they're mapped via a VMA,
> > not a gmem fd).  And vice versa, a PUNCH_HOLE on a SHARED gmem (if userspace is
> > using an INIT_SHARED gmem for the shared branch of a memslot) could invalidate the
> > PRIVATE mappings (of a different gmem instance).
> > 
> > That latter case in particular would be a functional bug, as spuriously zapping
> > PRIVATE SPTEs is fatal to TDX (destroys the memory contents).

...

> > Opportunistically rename the helper to capture that it returns the a filter
> > for all gfns in anticipation of zapping only the previous mapping types on
> > conversion.  

    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> > -static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
> > +static enum kvm_gfn_range_filter kvm_gmem_get_all_gfns_filter(struct inode *inode)
> >   {
> > +	if (gmem_in_place_conversion)
> > +		return KVM_FILTER_SHARED | KVM_FILTER_PRIVATE;
> 
> If I understand correctly, above diff is dead code and will change according
> to
> 
>   And then in the main in-place conversion patch, have the conversion
>   flow to only zap tap the "previous" types (with prep work as needed).

No, my thought is to keep the newly named kvm_gmem_get_all_gfns_filter() as-is,
continue using it flows where KVM needs to zap everything, e.g. PUNCH_HOLE, and
have the to-PRIVATE conversion flow open code KVM_FILTER_SHARED.
