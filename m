Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE66378828
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 10:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866008; cv=pass; b=em1SexDGWbNPPxBWxkkBwgWtswbA+ehJ/PveJw1je1O4IMEsh8PsES0BP+oX1fFDuIGCk2Rc9S5XPzQAZX9fo4Ase/K829dwTWYtEjtBVtl5hqGuLVBwyxEf/miXV12K/OpGL+IJtgEbReggBDFAXY/O2UEp9OopqxbFhFPnc+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866008; c=relaxed/simple;
	bh=GBE1TgSby7J232lUKGK26nn+IlCCdnbJXDX5316EbVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUJtah4/Gkw6xSZ3x2U5hbN/kqPIVa526jzsx0pbvCZNvsT7oQBorgiPO0DzPnnC4rZfLWa/501ItgCQrA7k6FatTLpYwXoS3eGPu+7TEcq82jCkCPNMVHRNQqgJhgCzR3grVTDrobuNFGA8QV8DKscLwqrIU3JQEP/wcOrT2fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mRAOqPL0; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mRAOqPL0"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51765531803so232031cf.0
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 03:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781866005; cv=none;
        d=google.com; s=arc-20260327;
        b=JV3DHHjvgsMov8hxhSsWHxZG78lthmGrYmJMwxtdK642oaIk4Y/p8USfa3At14f8XN
         wS3aFEcBMslcvY1GcKfNr/nxAqaKpFIV551zneHPq7hWSVDa663A6YDszVmiFTGVyj32
         voBzT7/6p6YcDXhsWrlySHTAuNy74dSEjaqvtzte1XJAuR62rnKRTzCy7hSCtNLt/r2+
         ScpImJYCP/GlUiIkOnXsF6GHY8eJawCLTYCE9I5n2HRvLwfW94mhbklMYnKrdSfkXCmM
         sn8fGvBLu6+Ij/HBZPqlICj0vlCM5doLtpbls5GfUcFflvm3KiIbZmMy7J6ZNURYuh7L
         boIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tqVqdR7eGLFAsCQYmX5JI1ornwlzeYgCHzhYfEkLeRM=;
        fh=pii8i87JygLwrT7qi8xisQjWM4NiUtALksNcZeA+ZHA=;
        b=Zl85dxGU7qkSmFMf18u5QxMHjprf1KrE+w9tyfk9WbOq9HJIaEhLb23ABUuPnSBFOi
         AwBkQGGe78AI/eMKflv+R/wXSZ1BUq1woxFDs6Lengj0NnvQx4YEWjeHcKlTcc8NR0SA
         fFLOyFlkXRvRu+zazV7M2mDpk8+K1Pwrp1pS3kq1ezf6gooTsy0Zk8C+j05Xt1NaYKMA
         je1EDBwO2uC1CcTc8Ysq85QXx0wKopEwu02KFehCB16dUfz5aUjDox6q0QI4+JkXbppw
         czuZTnM0XDpRDSFnqL3PMtQJJdvcgD1lcnCOZLvC0zHkltxzo1RlcdJD45p8fRRjPx53
         oPhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781866005; x=1782470805; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqVqdR7eGLFAsCQYmX5JI1ornwlzeYgCHzhYfEkLeRM=;
        b=mRAOqPL0AMHFXaViCInQlUIUG4goAYxViSYXwsIyI2nua9mCwqfAUqubeb4G/m65lh
         U7iAzjZL28x4hT3G+VgdFejpsqrQ8b0ZVXxE+f5aKu2mmhLO69Iqgg1bW7F9YbP4rqTT
         1AVgsxR2QT18PlANC8uX8PmJBYdXtYavkWd2/su990Iv48HqYCvFjIptmuuAt7sc2XhL
         eDndC+j7sG5FRlB418oEeDW48dJWUYgKFhvIdBiDXylLwMmGbbPkjDtcexOIAnrJNQsi
         5rs01Zt/IBoMJ3Nsqc9NIUhn4qGvqjosy3r5/ihw9VBmwadreeHtr4oe6uAocv2PAWK9
         9iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866005; x=1782470805;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tqVqdR7eGLFAsCQYmX5JI1ornwlzeYgCHzhYfEkLeRM=;
        b=JAp/nP/csdWNWkWfeKDrFjz/AAaDdE2omZTGo6aeicMQIiZ9VqiJQI+n98w9t8HSQJ
         TpUzNS0YpUSJfN+2k+FiRKzB/u7pAdHaGLTc5bUXmei8WjXPrbMU0mRdqTiBBb4AXgLR
         iVCY/mpHpaxCS5TVawH+pObXix2zoqioqnbjLIT8gkrMIpXsYvGshMDt2b6QA8voSuTl
         Yl83Fea9VNBqaHxbu7l53Rco7UIYlOvt0Ncd0LXRXDEy2Z6ah2mITJNw+9Q3LNghJKO4
         BcOS7KLHJe2By8pD/MVVJJ/uUnDpW85R1ZFQ8qe/yFlP+7X2Yd0cqkqcR2qQyZkvqnTN
         e38A==
X-Forwarded-Encrypted: i=1; AFNElJ9OCCQBlND/fRlFPZwEhG7E4wuHsGBMGu4HNtCwIm9DBuFsPXcBNbTXMEWIixepvlpgfoAMjENiUPP5@lists.linux.dev
X-Gm-Message-State: AOJu0YxXQtNuDpX6SmbDixTEbpoINdGuHCxX0tZPBKKt8XB1sQmqEFlw
	tTDKnwbY/6DMSYEJTRijYyX9v31Wx1Y326ep475YTFJiP30TCsr6bo2fDIfFPJPwTy8QllgSWEB
	Vu9ZlMfsNZ/RGlJY4zaIniN2sj8ycAvV68XH8GxCq
X-Gm-Gg: AfdE7cndx0EjJ1Ru/AlzmCJwnR3Ex4jWF+59ZJ3LQeyRd+QN4VG6z7HrErolLRmgGZJ
	OWrXTSL2EZpZDop/Bt6bjPrFNJV4PAQbwb8YE+pKfogPknkGQE/G6mxYEo7ILF3ETo065AqeKt6
	PeZmh2FdRmMiUjg7lGmcBIWhG+fla7UF9IOqBtG6By3MVR8lvmaCQazzBizTy7quf6obkTQ/Cqx
	JTQs4z6JAl6UxiloL19wtp5F67Sc3WyW6PBRUyTCP2EoeWnTJ8nEz1I2md9PUs165tRFgkQkA==
X-Received: by 2002:a05:622a:1b1d:b0:516:3def:1cf4 with SMTP id
 d75a77b69052e-519e877e8c5mr5598281cf.1.1781866004326; Fri, 19 Jun 2026
 03:46:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-19-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-19-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 11:46:06 +0100
X-Gm-Features: AVVi8Ccyp37Iml659Lz9n-v90nTTG1Iev3H81NTyrRm5pUpcj70uW3l4zFQ5-a4
Message-ID: <CA+EHjTxr1KrtZDakniWCF+c0E6s9_YbQ_gMVqCFnwEP3USEXXw@mail.gmail.com>
Subject: Re: [PATCH v8 19/46] KVM: guest_memfd: Use actual size for
 invalidation in kvm_gmem_release()
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> __kvm_gmem_invalidate_begin() and __kvm_gmem_invalidate_end() actually do
> not specially handle -1ul. -1ul is used as a huge number, which legal
> indices do not exceed, and hence the invalidation works as expected.
>
> Since a later patch is going to make use of the exact range, calculate the
> size of the guest_memfd inode and use it as the end range for invalidating
> SPTEs.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  virt/kvm/guest_memfd.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index d163559da0235..d72ecbfcc3144 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -366,6 +366,7 @@ static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>
>  static int kvm_gmem_release(struct inode *inode, struct file *file)
>  {
> +       pgoff_t end = i_size_read(inode) >> PAGE_SHIFT;
>         struct gmem_file *f = file->private_data;
>         struct kvm_memory_slot *slot;
>         struct kvm *kvm = f->kvm;
> @@ -396,9 +397,9 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
>          * Zap all SPTEs pointed at by this file.  Do not free the backing
>          * memory, as its lifetime is associated with the inode, not the file.
>          */
> -       __kvm_gmem_invalidate_start(f, 0, -1ul,
> +       __kvm_gmem_invalidate_start(f, 0, end,
>                                     kvm_gmem_get_invalidate_filter(inode));
> -       __kvm_gmem_invalidate_end(f, 0, -1ul);
> +       __kvm_gmem_invalidate_end(f, 0, end);
>
>         list_del(&f->entry);
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
