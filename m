Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820A83EE1D5
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288330; cv=pass; b=So9PbySjeWMtWj25pimKd1z7HYOnkZZcYVqDpFQ5L4mZkW58njQqgS43Ea74pDYNOduxwXSPKcxzlHpHp5lw0LJn1NBTRTREQMpZQPsm+rptopXjbPn0SEGZggZk8EdSQM3EgKsJh7FugmWE8pFcwgpjha8W3RPwOKct8Z2oGLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288330; c=relaxed/simple;
	bh=mWVxXGnAXrLsmeGW6dcs9mbi7yfF/v+MCyKGHC9nj44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fs8kMWAsXwhCha+ttQARA5gdCKXTSgd7/Njxq+v/B6yPUfeqA/zwq92Tzuc4ZD+aYmpX9ihpUbC3i+k93qFrCDnUDYO2pr7qwCx09JOVbEk/RqV3hKSkbYBTYtKO5IH9udFY298biuA9bp1KoN3Clx70cViRCWL2A5FJEV63lqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rjyAM6CU; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rjyAM6CU"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50d864c23bdso19381cf.1
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 07:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779288325; cv=none;
        d=google.com; s=arc-20240605;
        b=hWTtk7bBMJZ8t6jzjIea6P31tKZyesQSoRwFTEiecmpKbPiD+9qOZgqoeRzEx3Lx8+
         nVdFF4CwKRtWa4o/VvQOCk5G+PGhjAV2oWOh7/VhVjG/gtqDPEFISnOOCEf6V0m6FjwM
         tmuiCevE1Ez0vR7eEvV+7boEkBEB+JBKeMCtpFHg2rrYrsmc83Up8fo1a8zLgOJoYJg8
         HsSODX71nHpXksKLpGqiHWyTbDdasrPInstQjEJze/cS81urLjgpbNRRSiwhjKFMB90P
         1LfSvQ2IBkwKUDlITiEmNhiYoQzJCIkx35Ehl8XbW51EXBEuEwS4uXwX3F11ixdNdZ2r
         csag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BXmdRbmYCHoIn3PGJ6dUolIetDSUosv3AORcVct4e6A=;
        fh=sb4UNA6jorRIXIXrpXao1vgn4Ypi2TJWsTB9sncq0RM=;
        b=TbBv/nj86bcvWuyk744rVCdTMEVZ1AB5OecUDWtH2y0rpk+uEv2uKznVXkKCEyqoiM
         oAQOC/yGXnIAI78sVLBZwLyp56+7cF04D18kVhu2D1ATsGvnm607Vyvtj4hP5ykQC0BB
         cov2zUtmIvLZPW9qlsNMwD5LtwJsh5k0GZRPN4r5EejgrqDQsO0UggbSA6cw7tVasdNw
         n54xngYhSwfmvbo2w/iRB/+cP7i9PL5VhGNHzQdFt55rNFC9jKpeMgUYH8hVvUr872dv
         kAC6jCu7ISYpYbX9wWtGDFFkgIR+lAH3ibl4pGyF9pvPEZ7fOJkDxNGhrXqT4oqzHIUo
         T+BQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779288325; x=1779893125; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BXmdRbmYCHoIn3PGJ6dUolIetDSUosv3AORcVct4e6A=;
        b=rjyAM6CUSSIYTYgxbj6T3LNbGrG9AovNLcDj7vUSjk5dmH4kRxCPU3h3t856it/pNv
         K2z2LeoaMsVzFpN0d28btNNok5+y9r3nJrkHhjSBry6qyaKOn+1WUWUFVMrKuzJNE7wD
         AW+HmNxNucH2XUfG/9ab77/LlaBSAt61VFaS763JQiU98cEMkcX37ge2jhYpU4fujhfY
         HpGF9bAxw5+0GaALiT5Hl54nqWWBjVJ/PTuDYXjGB6D+8jrNm5Ft/+zqAsLiyvLyKHpD
         OZQMPMkkjLwI8BzjMfbphb/wEyzQX2GxyXRkX8D2WFsS/kN0TFl8aBr1PQdzOrYJJAa+
         d2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288325; x=1779893125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXmdRbmYCHoIn3PGJ6dUolIetDSUosv3AORcVct4e6A=;
        b=dIJgf/fUTNfT0++ISAKUTfxQaIlqoTtxT2xwdrypo7vIJG+FrGo3pDfcNOoBXZfqL6
         eYTPlq7DrxY+qrJFamm9Zj/SI3qy0serxixrEi1EcCKusNseC3YoIbemfE50L468V/Y/
         tqT5Qz2eiNzT6ciKYggf/gsSACSNoVlpru2VDGqGBcurhBobtES91kI7jDcLzhewYeVF
         OQ4fRkltAKiEcWOcNU4R+wnlYroPKII1DQC6kOZCEt/R+r/0apl1rN/mbcd7A9P9jUBC
         xrnqJ7ktvnN2MMnZhMBdN8dwBK7TrYqVccqjjQrpRjE0d+piAOSRmB9jh2ItEQFNJuIn
         4d0w==
X-Forwarded-Encrypted: i=1; AFNElJ+FxwSthIDnWBU7xxf5shAYKiSnHgC6CfqfDPo5RWmicdcTsdwemBSPEtnj9IKQtfeRNnGp/3Vy0ELZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxmZtnIV9NTWYCElHQ+PM2cKDQJvimPeLJCG/cxoBTaYUCN8NAh
	2ZvR1UEi2MBjJxZ1+aQ4cgwOIJLHsat5fCt78wTiOjQ3vIAdnjjrTm3GVLyXo08gl801i7JvtVd
	br5LZagCKI4th4sI4LzTgaWl9JE4xbqa02b7ub/t1
X-Gm-Gg: Acq92OFI+iwpQ07G9oxkRVfDBgnQGvVjpBJDUj6wUkFjyYgSzSutlGcg9qPvr3tBhx+
	xQylO3MjccmB+/pBFUMthkfaOuEjOQU6E1Be5gJenOE2NbTgkhjFpWy+TYvap1O8GfEgM/kS0Wz
	QK4d5TMLx/glOLbtzNg6fljowUsLG2RL4RYTsY5FwoFzBD3Yh7x4psnaUfiPMJE0yVKrlrN1/cn
	hxVekDqMZn7xWdn8jo6mUV/yyw+XFmN5hzobyjJwcuJnaJzfqXsMT5OS+weX/ZYH15SDW5Nu5BQ
	CAFwbOlio24A3/skQNqzMzm5NKWA1A==
X-Received: by 2002:a05:622a:5d4:b0:516:4197:361 with SMTP id
 d75a77b69052e-5167937f111mr20387831cf.4.1779288323895; Wed, 20 May 2026
 07:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-13-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-13-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 15:44:46 +0100
X-Gm-Features: AVHnY4KqHADZuRuQJRLOmHo6Gq8ybi2wyD-GO9LIDMQsvWy73n-zAaUp_TqUxxQ
Message-ID: <CA+EHjTzDx01W5Xy=eMg54DGe8-+Pfz9u8XDgfSDiAJYu8MznmQ@mail.gmail.com>
Subject: Re: [PATCH v6 13/43] KVM: guest_memfd: Return early if range already
 has requested attributes
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Extract a helper out of kvm_gmem_range_is_private() that checks that a
> range has given attributes.
>
> Optimize setting memory attributes by returning early if all pages in the
> requested range already has the requested attributes.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  virt/kvm/guest_memfd.c | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index baf4b88dead1f..034b72b4947fb 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -86,6 +86,23 @@ static bool kvm_gmem_is_shared_mem(struct inode *inode, pgoff_t index)
>         return !kvm_gmem_is_private_mem(inode, index);
>  }
>
> +static bool kvm_gmem_range_has_attributes(struct maple_tree *mt,
> +                                         pgoff_t index, size_t nr_pages,
> +                                         u64 attributes)
> +{
> +       pgoff_t end = index + nr_pages - 1;
> +       void *entry;
> +
> +       lockdep_assert(mt_lock_is_held(mt));
> +
> +       mt_for_each(mt, entry, index, end) {
> +               if (xa_to_value(entry) != attributes)
> +                       return false;
> +       }
> +
> +       return true;
> +}
> +
>  static int __kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>                                     pgoff_t index, struct folio *folio)
>  {
> @@ -649,12 +666,15 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>         pgoff_t end = start + nr_pages;
>         struct maple_tree *mt;
>         struct ma_state mas;
> -       int r;
> +       int r = 0;
>
>         mt = &gi->attributes;
>
>         filemap_invalidate_lock(mapping);
>
> +       if (kvm_gmem_range_has_attributes(mt, start, nr_pages, attrs))
> +               goto out;
> +
>         mas_init(&mas, mt, start);
>         r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
>         if (r) {
> @@ -1140,20 +1160,13 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>  static bool kvm_gmem_range_is_private(struct gmem_inode *gi, pgoff_t index,
>                                       size_t nr_pages, struct kvm *kvm, gfn_t gfn)
>  {
> -       pgoff_t end = index + nr_pages - 1;
> -       void *entry;
> -
>         if (vm_memory_attributes)
>                 return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>                                                        KVM_MEMORY_ATTRIBUTE_PRIVATE,
>                                                        KVM_MEMORY_ATTRIBUTE_PRIVATE);
>
> -       mt_for_each(&gi->attributes, entry, index, end) {
> -               if (xa_to_value(entry) != KVM_MEMORY_ATTRIBUTE_PRIVATE)
> -                       return false;
> -       }
> -
> -       return true;
> +       return kvm_gmem_range_has_attributes(&gi->attributes, index, nr_pages,
> +                                            KVM_MEMORY_ATTRIBUTE_PRIVATE);
>  }
>
>  static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
