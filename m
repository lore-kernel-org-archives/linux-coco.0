Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF50634
	for <linux-coco@lists.linux.dev>; Sat, 19 Aug 2023 02:09:09 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-99357737980so191992966b.2
        for <linux-coco@lists.linux.dev>; Fri, 18 Aug 2023 19:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692410947; x=1693015747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k267oI+dAzHZnNHVlp3pyDBJcaxDuy7lG9Dkzmn1h54=;
        b=IbadbjFEIrpByLcq3LOudohJQP2TQWqZ0x1Sw2sI0NDuGFEM6+9ANcua8u4AxFhPF0
         hK5AnMtjOJdFCJYcwcNlRYoD5C4JBeZgyPOHKHUGZf9X2qe3x3EeCYVMGp4HbEpTAW6h
         CbW+bZGRLJJBI3bCz8xUBIL6nk7MNujaLsNTrpy9chBrhGx6/PCiH6t4V+d9AwtkvNj7
         DCjvo099IDXY/BS9HBA8/gkXjsCdPzGlibIBbXWg/VtcdE6MKVov37lKs68CtwxBOk1H
         KlYsOa7gSDONJS+ku+ZpNecNzgp0OwYRlGXVuALnpVcN2Gq4igK20o3eGAtJn75Y2+Ad
         Ia4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692410947; x=1693015747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k267oI+dAzHZnNHVlp3pyDBJcaxDuy7lG9Dkzmn1h54=;
        b=WXiZJxwe+vBFoQVGCYlETFyy/fFYxccVL3K7h3+rLPQ5olHA4Tz+79rXp0+19+ecIU
         d0vJWKHRcVngJYjrD3LutQJ2tWNixYcsepgde1pp3FkF12Jq1JastRvM0jLc5X4MJqW9
         c/xYR7fNOxe5ZfY3t34IGcnqc/QcJePnTJpyUxkNFdcKhS4TnkiNZzwYOOIGNLwj/jM7
         fb280KHDK7qNupaQSQgA01KGOc5SLD2/u8YAWL00WFL/p5WpvkbHOdb5kqpzj6rW5D5j
         DxQ/01bLg6BuVcIEpHZtiXFq2yZ0aO5JSqHFYkkjSdIisQ30EmA65trVdGC4sxghhEzC
         k9Fw==
X-Gm-Message-State: AOJu0Yy3rTYN8n9tjbDLawuvGeHV0KtigAPk21tggrsfhd2V6QnoTrEN
	D1+8m/JRkRKf3YhCMwBk0oC8y4AN4vsgnGKdGRSGtg==
X-Google-Smtp-Source: AGHT+IFuMGk+o9gVI4or+3uEppGaYEoS4rzz60lJAU827sHHVMZx4j/Ip1xtz6eMASi3EVSZaRpwSuKFikjlG5+fIQ0=
X-Received: by 2002:a17:906:1c:b0:99c:bb4d:f596 with SMTP id
 28-20020a170906001c00b0099cbb4df596mr709096eja.6.1692410947101; Fri, 18 Aug
 2023 19:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692119201.git.isaku.yamahata@intel.com>
 <b37fb13a9aeb8683d5fdd5351cdc5034639eb2bb.1692119201.git.isaku.yamahata@intel.com>
 <ZN+whX3/lSBcZKUj@google.com> <52c6a8a6-3a0a-83ba-173d-0833e16b64fd@amd.com> <ZN/0aefp2gw5wDXk@google.com>
In-Reply-To: <ZN/0aefp2gw5wDXk@google.com>
From: Mingwei Zhang <mizhang@google.com>
Date: Fri, 18 Aug 2023 19:08:30 -0700
Message-ID: <CAL715WL9TJzDxZE8_gfhUQFGtOAydG0kyuSbzkqWTs3pc57j7A@mail.gmail.com>
Subject: Re: [PATCH 4/8] KVM: gmem: protect kvm_mmu_invalidate_end()
To: Sean Christopherson <seanjc@google.com>, Jacky Li <jackyli@google.com>
Cc: Ashish Kalra <ashish.kalra@amd.com>, isaku.yamahata@intel.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com, 
	Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, 
	Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Jacky Li

On Fri, Aug 18, 2023 at 3:45=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> +Mingwei to correct me if I'm wrong
>
> On Fri, Aug 18, 2023, Ashish Kalra wrote:
> >
> > On 8/18/2023 12:55 PM, Sean Christopherson wrote:
> > > On Tue, Aug 15, 2023, isaku.yamahata@intel.com wrote:
> > > > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > > >
> > > > kvm_mmu_invalidate_end() updates struct kvm::mmu_invalidate_in_prog=
ress
> > > > and it's protected by kvm::mmu_lock.  call kvm_mmu_invalidate_end()=
 before
> > > > unlocking it. Not after the unlock.
> > > >
> > > > Fixes: 8e9009ca6d14 ("KVM: Introduce per-page memory attributes")
> > >
> > > This fixes is wrong.  It won't matter in the long run, but it makes m=
y life that
> > > much harder.
> > >
> > > > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > > > ---
> > > >   virt/kvm/kvm_main.c | 15 ++++++++++++++-
> > > >   1 file changed, 14 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > > index 8bfeb615fc4d..49380cd62367 100644
> > > > --- a/virt/kvm/kvm_main.c
> > > > +++ b/virt/kvm/kvm_main.c
> > > > @@ -535,6 +535,7 @@ struct kvm_mmu_notifier_range {
> > > >           } arg;
> > > >           gfn_handler_t handler;
> > > >           on_lock_fn_t on_lock;
> > > > + on_unlock_fn_t before_unlock;
> > > >           on_unlock_fn_t on_unlock;
> > >
> > > Ugh, shame on my past me.  Having on_lock and on_unlock be asymmetric=
al with respect
> > > to the lock is nasty.
> > >
> > > I would much rather we either (a) be explicit, e.g. before_(un)lock a=
nd after_(un)lock,
> > > or (b) have just on_(un)lock, make them symetrical, and handle the SE=
V mess a
> > > different way.
> > >
> > > The SEV hook doesn't actually care about running immediately after un=
lock, it just
> > > wants to know if there was an overlapping memslot.  It can run after =
SRCU is dropped,
> > > because even if we make the behavior more precise (right now it blast=
s WBINVD),
> > > just having a reference to memslots isn't sufficient, the code needs =
to guarantee
> > > memslots are *stable*.  And that is already guaranteed by the notifie=
r code, i.e.
> > > the SEV code could just reacquire SRCU.
> >
> > On a separate note here, the SEV hook blasting WBINVD is still causing
> > serious performance degradation issues with SNP triggered via
> > AutoNUMA/numad/KSM, etc. With reference to previous discussions related=
 to
> > it, we have plans to replace WBINVD with CLFLUSHOPT.
>
> Isn't the flush unnecessary when freeing shared memory?  My recollection =
is that
> the problematic scenario is when encrypted memory is freed back to the ho=
st,
> because KVM already flushes when potentially encrypted mapping memory int=
o the
> guest.
>
> With SNP+guest_memfd, private/encrypted memory should be unreachabled via=
 the
> hva-based mmu_notifiers.  gmem should have full control of the page lifec=
ycles,
> i.e. can get the kernel virtual address as appropriated, and so it SNP sh=
ouldn't
> need the nuclear option.
>
> E.g. something like this?
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 07756b7348ae..1c6828ae391d 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2328,7 +2328,7 @@ static void sev_flush_encrypted_page(struct kvm_vcp=
u *vcpu, void *va)
>
>  void sev_guest_memory_reclaimed(struct kvm *kvm)
>  {
> -       if (!sev_guest(kvm))
> +       if (!sev_guest(kvm) || sev_snp_guest(kvm))
>                 return;
>
>         wbinvd_on_all_cpus();

I hope this is the final solution :)

So, short answer: no.

SNP+guest_memfd prevent untrusted host user space from directly
modifying the data, this is good enough for CVE-2022-0171, but there
is no such guarantee that the host kernel in some scenarios could
access the data and generate dirty caches. In fact, AFAIC, SNP VM does
not track whether each page is previously shared, isn't it? If a page
was previously shared and was written by the host kernel or devices
before it was changed to private. No one tracks it and dirty caches
are there!

So, to avoid any corner case situations like the above, it seems
currently we have to retain the property: flushing the cache when the
guest memory mapping leaves KVM NPT.

Of course, this is fundamentally because SME_COHERENT only applies to
CPU cores, but not DMA. If SME_COHERENT is complete, flushing is no
longer needed. Alternatively, we need extra bookkeeping for KVM to
know whether each page has dirty cache lines. Another alternative is
to filter mmu_notifier reasons, which is the part that I am planning
to take. thoughts?

Thanks.
-Mingwei
