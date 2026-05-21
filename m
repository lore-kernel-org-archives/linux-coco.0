Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409CE3D5C07
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370222; cv=pass; b=qQFbkWbtcNUVOWrOcxFS6OTt1TEyiZNH/CXDT12UUPg1rVphFsNT4L/AVWBG+cyZFyJWKxRS+kRytIdAm+UxNsLrPXmyxyy8sgZFZc8XOq6xA+8SOyfmzRrSuGlqn15uQ59iuzZwbmjWro9SHt7R4Luk/xwYqsx+al84oKISqyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370222; c=relaxed/simple;
	bh=rf2fbns6mOkK4Zz993uC2XOU6G08aILoYRXzFHnjEAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bw801t2NxpQbwTC98iNh6DlIsVr2Q0dMcG7/C6vAS6ynul0f6n5Ej1UjlNy75JqLRJMm0FwuquFB9csX0ho3la3sLX0S4m2OzyjtGr9ljKMFS8sQB7bkPr+c2U4OJqCrWcagKP7gMbjt5gDcQprAe6lB0K5ZPvmILMHvxVOg3+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ue4N+dSc; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ue4N+dSc"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50e61648f10so38941cf.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 06:30:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779370218; cv=none;
        d=google.com; s=arc-20240605;
        b=f98riYJSQsKnVJJ9AS6UX79Ikrowr80PIxJqimnLb5YsFfsNcImj1Qb3PPjGVsZkbG
         73OQKMMESjcCXFq99jHj3NN+mBSV8wB+E3ANL1prEFWdi6c81P1kcwe/q0OlbicH+6/z
         xX+myKoa6nLlkDaaKOL1+UwIhawR6IJAPfIqT4+5UI000liiA/op+5sboQvlQpekH0/s
         pfKS6wwFzyxvlEmYHMp9xmxqUBbcak1M2M7doBBd+dy8/mor3iNG5wkkLJgXan9SMCMk
         jLsPc82SyaV2DeIKrGPJlVrSo10JQJ7fvkxU+geiV0duGqBQ3zQd53KMKa4npaBKKaIn
         L3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iwMA7nMY573fkX+5mD/InfckLTj4HhiPS4RhTrsDllw=;
        fh=x50WPoolNyHkgIGTZgqMNBI2ZKuUuasloX31uP8hPkE=;
        b=ZGmKdb/lhCRgSQ9JvyNu/n1/qPmgwmgGIKDBZDcinMHo9zcUw/4IWroYSEYQFi16Yp
         ZObE60cNVUENeJurFdoMM/22n4QdsVZL+fp1EBY8OHfe9nRXFGEzteOJshepvP8AF4pt
         X0ThsUzQGNRAfPJacRoWe71FYexTKPAFag71zaDuJ83RLI0X1U4LGUaHKQVw9JdO1b8p
         bVKXl1+TGIrATLb3bEcxYTy3yPEoSvqbJBzPRyAFRgiZeWj5zcYcFBcthuT0UIU3puEM
         m3VWheHoen5Ys6wHXwWqVBs2mUhgaReXaS5URzZuBFF35NZkwHlEEZFeUGgqgbSHGOGP
         Etlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779370218; x=1779975018; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iwMA7nMY573fkX+5mD/InfckLTj4HhiPS4RhTrsDllw=;
        b=Ue4N+dSc6VdNs6HKy9al2lyEp9639wkf0r0zQnvmneq7EdOBa3j7EbaeARMGM/LwVT
         yCMbNTD9tnfuRKxT3IWwdHmHX3M6ptSbv5W9zycv3K3hPUeM/IX58ej0oPG344iS8Omj
         Q8ot8cJGq4yGCOpkLq+AmSBKYaqSm9udgt8RLvPJBrcqx0mPuf5zv5z8ulZMdcsY34rk
         /cIUFlMcf+C4yoGN2+6GtmQZXArECfApNi0U93nbc0CqXj3US1C1m0SPWI92WMuxTXWE
         yAcGtuPems/3bo6az60pqLvMsvH8XmPBdsqGOqpcdslbiT46Afo0dnVIrWpfHhXOziXD
         cfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370218; x=1779975018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwMA7nMY573fkX+5mD/InfckLTj4HhiPS4RhTrsDllw=;
        b=cE49BExP5Ca/rvSDGTiHMYs2gdvxedQf9QmW/tarrwhqLH9d++NSCRxrwrUmsRwhWA
         Ri3JyQUtoO/9YQJIc0iPCbYgiylpwQ8vQ+ReacvcoxSBMBeIl1yyu17XZhv/k6HretYT
         R+IDSNH0o9StZR9IRmdls+pWy1CBQKMijSWOP2EDe7roXfnImWGO8vAOEQ0f92Ojld3O
         69XmTnDvpDvD5dy4/jrsThY03F00LgjXjdFpRZmB606wSB0M69pwzvRaFn7LrV5LmJk7
         AkgoMwx6KzA31+env6O5yax/FoQ2nLmT3Wu4XtZ54s6pTOonFJhj9ZEy5+WGXxeTdc1+
         L1RQ==
X-Forwarded-Encrypted: i=1; AFNElJ80cRu4MDDKqk79UzPDlLFwr7nIbc4oJW1x7OmhSag90Xd12yTAGWsDtUNqzsdgvd3fUG4nZWDYwIcS@lists.linux.dev
X-Gm-Message-State: AOJu0YxIeescNW4zMdRgLw+2WMR9FODMeQQ0FvbaWk8oBGFwpqsQD8rv
	gfJreHGLxA9eIovn1pXHLNP5oepfmx75MMVtYETe51ssrSdPyVJ4MV74vH31FxCPSZgehTGT/Ab
	tBpx90fu72eVg1xBJHFpNwX77Y8wIJaLRF7Z69wHP
X-Gm-Gg: Acq92OENs6nzr/53tzmkDkToCb1SrODqYisWClL73q4k2vv5pfWmdPma/l+3aHiFKGp
	RvfuybF18CndIg3dkLCE/IDOSrQzLEEV+JlhLuaTOiJNOIam0DtslecwMazFgfa7UV3XOEdQC0p
	igQtREjmG5g3UHJNZ0fc7e0Zzx7o3UvDRim9NUz0gj4Ao0NxUVXZgBiH4GBUp+C4bhIhM6zUMsf
	U2k3dcK1vmNCu9M32heSpk9ECAdvgM9MURcA0jvsQ6upCJ38yKH7ogDZdEQ9yOWgxdJiujlpYV5
	jpvK/1ihO4MkafYas2y5rY1jlD8KtQ==
X-Received: by 2002:a05:622a:180f:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-516c52f3a46mr9684061cf.5.1779370216975; Thu, 21 May 2026
 06:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-16-91ab5a8b19a4@google.com>
 <CA+EHjTxcadguOfOo7RpJVtAzcY5JAFZTbrAT_wcN6akMi8gCUg@mail.gmail.com> <ag8BmtzxTlcuA_zy@google.com>
In-Reply-To: <ag8BmtzxTlcuA_zy@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 14:29:00 +0100
X-Gm-Features: AVHnY4LwO5a6KnCwO_nS2hLkyezQ0CT4SoGe3eTfLFP9egS879lHs2YrlxKCX6M
Message-ID: <CA+EHjTwA_qOnbKhGSDxo_nbsXRqTM1zY1Jqs1drn24PTv-fNPA@mail.gmail.com>
Subject: Re: [PATCH v6 16/43] KVM: guest_memfd: Use actual size for
 invalidation in kvm_gmem_release()
To: Sean Christopherson <seanjc@google.com>
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
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 May 2026 at 13:59, Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, May 21, 2026, Fuad Tabba wrote:
> > Hi Ackerley,
> >
> > On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
> > <devnull+ackerleytng.google.com@kernel.org> wrote:
> > >
> > > From: Ackerley Tng <ackerleytng@google.com>
> > >
> > > __kvm_gmem_invalidate_begin() and __kvm_gmem_invalidate_end() actually do
> > > not specially handle -1ul. -1ul is used as a huge number, which legal
> > > indices do not exceed, and hence the invalidation works as expected.
> > >
> > > Since a later patch is going to make use of the exact range, calculate the
> > > size of the guest_memfd inode and use it as the end range for invalidating
> > > SPTEs.
> > >
> > > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> >
> > Want to look at what Sashiko has to say? Seems to be a real issue:
> >
> > https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=16
> >
> > If I understand correctly, the fix should simple: use
> > check_add_overflow() to validate the offset and size parameters in
> > kvm_gmem_bind()
> >
> >    int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> >              unsigned int fd, loff_t offset)
> >    {
> >        loff_t size = slot->npages << PAGE_SHIFT;
> >    +    loff_t end;
> >        unsigned long start, end_index;
> >        struct gmem_file *f;
> > ...
> >    -    if (offset < 0 || !PAGE_ALIGNED(offset) ||
> >    -        offset + size > i_size_read(inode))
> >    +    if (offset < 0 || !PAGE_ALIGNED(offset) ||
> >    +        check_add_overflow(offset, size, &end) ||
>
> Eww, TIL I'm not a fan of check_add_overflow().  Burying an out-param in an
> if-statement is nasty.
>
> >    +        end > i_size_read(inode))
>
> This is all rather silly.  @offset and and @slot->npages are fundamentally
> unsigned values.   I don't see any reason to convert them to signed values, only
> to convert them *back* to unsigned values (when stored in start/end, because xarrays
> operate on "unsigned long" indices).
>
> i_size_read() obviously has to return a positive value, so can't we just do this?

lgtm,
/fuad

>
> diff --git virt/kvm/guest_memfd.c virt/kvm/guest_memfd.c
> index a35a55571a2d..9c6dbb54e800 100644
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -640,9 +640,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  }
>
>  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> -                 unsigned int fd, loff_t offset)
> +                 unsigned int fd, u64 offset)
>  {
> -       loff_t size = slot->npages << PAGE_SHIFT;
> +       u64 size = slot->npages << PAGE_SHIFT;
>         unsigned long start, end;
>         struct gmem_file *f;
>         struct inode *inode;
> @@ -664,8 +664,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>
>         inode = file_inode(file);
>
> -       if (offset < 0 || !PAGE_ALIGNED(offset) ||
> -           offset + size > i_size_read(inode))
> +       if (!PAGE_ALIGNED(offset) || offset + size > i_size_read(inode))
>                 goto err;
>
>         filemap_invalidate_lock(inode->i_mapping);
> diff --git virt/kvm/kvm_mm.h virt/kvm/kvm_mm.h
> index 9fcc5d5b7f8d..3cb5ef86d0d9 100644
> --- virt/kvm/kvm_mm.h
> +++ virt/kvm/kvm_mm.h
> @@ -72,7 +72,7 @@ int kvm_gmem_init(struct module *module);
>  void kvm_gmem_exit(void);
>  int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args);
>  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> -                 unsigned int fd, loff_t offset);
> +                 unsigned int fd, u64 offset);
>  void kvm_gmem_unbind(struct kvm_memory_slot *slot);
>  #else
>  static inline int kvm_gmem_init(struct module *module)
> @@ -80,9 +80,8 @@ static inline int kvm_gmem_init(struct module *module)
>         return 0;
>  }
>  static inline void kvm_gmem_exit(void) {};
> -static inline int kvm_gmem_bind(struct kvm *kvm,
> -                                        struct kvm_memory_slot *slot,
> -                                        unsigned int fd, loff_t offset)
> +static inline int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> +                               unsigned int fd, u64 offset)
>  {
>         WARN_ON_ONCE(1);
>         return -EIO;
>
