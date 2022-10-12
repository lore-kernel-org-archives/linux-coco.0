Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7468A33DF
	for <linux-coco@lists.linux.dev>; Wed, 12 Oct 2022 22:53:55 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id n73so5124iod.13
        for <linux-coco@lists.linux.dev>; Wed, 12 Oct 2022 15:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RQNjMU9F7vPSKS5uWf+TJ+P/AZGC+XAnlHRyO/MXA08=;
        b=rEFHKVqXjRvwQxwzGNNKKFp9aOGsLl53zJS6B4HC04ArBiJtVtMayr7GLgt65O+xtM
         XSii2F5kbX/kegvMstg+rbvPHPeaMkSzCFYq6w70RrfeBBgGGoaM4ENO9LCmsIWUWwDE
         eT2JK8bZsylPfKGQ7s4U+Cb/JN39xCy4jiycSKOf9k8zvlQzvZkLieDkLuJQoOGN6pMW
         0YpmVTJWofQHNkSH9CJ5f0t4QaVOBbQk7q0xtASQHjdEhZuCd8xQATwsDwqRpwIOesq1
         YBzAX5ooidsB6GNtasb8F4BlSnmBBl31994gI/IcgXqb1zyWn8D0pHaeHb0Bm97dxjfs
         E18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQNjMU9F7vPSKS5uWf+TJ+P/AZGC+XAnlHRyO/MXA08=;
        b=mWM3ISBV4oL31dkqOY6v4mnJ4I1vA+dl+aoiFiJBL3tVhp0NXfatTDpBWTaVq70uEK
         BpQRwwdv6iJ5xjZWMPB9m+4bzPtUPnXCgghhKV3PTqghceKIGs5A8C1K4TP0rIR2xmyU
         et6IcUhOtSL7oxhQLycff+XHcDC/LGouKfCb2wdaplZ4sOlikcY8p9dLnmWVKAWLqQ9u
         Q6K06aDjzE4qdK5+3TNYjwJY1n+BArtZR7Q4lh9vUfZNSeHYrhbExgQMej8sLW74ES0m
         NXfLpnsQGfKomsXwHiG5QAf3zDKGFQO62VyWR01Av7ZZp08xIG1We4eMz8MnryW1hmDl
         zyvA==
X-Gm-Message-State: ACrzQf0K/icp/O1GM853sOwnfbhu/Y10PLyVUYUtrkWq1Rn4/ChrUSIW
	5e7ADi08ZZGoe90f3D9HQdnLcOo24mL5L+Qt5FDoEg==
X-Google-Smtp-Source: AMsMyM7e+//UCnfRh+nTLZE0owcwmsn4kCNm6rKOkfT2PnUs3F5HM7g0xf1cXM3+hs8+Yq0l9mPms5F8A4MHIDVW4Zs=
X-Received: by 2002:a5e:d506:0:b0:6a4:b8b3:a6f0 with SMTP id
 e6-20020a5ed506000000b006a4b8b3a6f0mr14689600iom.138.1665615234351; Wed, 12
 Oct 2022 15:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655761627.git.ashish.kalra@amd.com> <d7decd3cb48d962da086afb65feb94a124e5c537.1655761627.git.ashish.kalra@amd.com>
 <CABpDEukNp9eH8jXpv6+Dun+e943AbEMA6G68uQu=TrOLSvh_oA@mail.gmail.com> <318682c1-34a5-44e3-a15e-ef71067d4fd7@amd.com>
In-Reply-To: <318682c1-34a5-44e3-a15e-ef71067d4fd7@amd.com>
From: Alper Gun <alpergun@google.com>
Date: Wed, 12 Oct 2022 15:53:43 -0700
Message-ID: <CABpDEun0KTeWXqRS0Xj5mDTajix_xGt5DTpqtK_wfGcSH3Cu1Q@mail.gmail.com>
Subject: Re: [PATCH Part2 v6 41/49] KVM: SVM: Add support to handle the RMP
 nested page fault
To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	michael.roth@amd.com, vbabka@suse.cz, kirill@shutemov.name, 
	ak@linux.intel.com, tony.luck@intel.com, marcorr@google.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, dgilbert@redhat.com, 
	jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 10, 2022 at 7:32 PM Kalra, Ashish <ashish.kalra@amd.com> wrote:
>
> Hello Alper,
>
> On 10/10/2022 5:03 PM, Alper Gun wrote:
> > On Mon, Jun 20, 2022 at 4:13 PM Ashish Kalra <Ashish.Kalra@amd.com> wrote:
> >>
> >> From: Brijesh Singh <brijesh.singh@amd.com>
> >>
> >> When SEV-SNP is enabled in the guest, the hardware places restrictions on
> >> all memory accesses based on the contents of the RMP table. When hardware
> >> encounters RMP check failure caused by the guest memory access it raises
> >> the #NPF. The error code contains additional information on the access
> >> type. See the APM volume 2 for additional information.
> >>
> >> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> >> ---
> >>   arch/x86/kvm/svm/sev.c | 76 ++++++++++++++++++++++++++++++++++++++++++
> >>   arch/x86/kvm/svm/svm.c | 14 +++++---
> >>   2 files changed, 86 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> >> index 4ed90331bca0..7fc0fad87054 100644
> >> --- a/arch/x86/kvm/svm/sev.c
> >> +++ b/arch/x86/kvm/svm/sev.c
> >> @@ -4009,3 +4009,79 @@ void sev_post_unmap_gfn(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn)
> >>
> >>          spin_unlock(&sev->psc_lock);
> >>   }
> >> +
> >> +void handle_rmp_page_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
> >> +{
> >> +       int rmp_level, npt_level, rc, assigned;
> >> +       struct kvm *kvm = vcpu->kvm;
> >> +       gfn_t gfn = gpa_to_gfn(gpa);
> >> +       bool need_psc = false;
> >> +       enum psc_op psc_op;
> >> +       kvm_pfn_t pfn;
> >> +       bool private;
> >> +
> >> +       write_lock(&kvm->mmu_lock);
> >> +
> >> +       if (unlikely(!kvm_mmu_get_tdp_walk(vcpu, gpa, &pfn, &npt_level)))
> >> +               goto unlock;
> >> +
> >> +       assigned = snp_lookup_rmpentry(pfn, &rmp_level);
> >> +       if (unlikely(assigned < 0))
> >> +               goto unlock;
> >> +
> >> +       private = !!(error_code & PFERR_GUEST_ENC_MASK);
> >> +
> >> +       /*
> >> +        * If the fault was due to size mismatch, or NPT and RMP page level's
> >> +        * are not in sync, then use PSMASH to split the RMP entry into 4K.
> >> +        */
> >> +       if ((error_code & PFERR_GUEST_SIZEM_MASK) ||
> >> +           (npt_level == PG_LEVEL_4K && rmp_level == PG_LEVEL_2M && private)) {
> >> +               rc = snp_rmptable_psmash(kvm, pfn);
> >
> >
> > Regarding this case:
> > RMP level is 4K
> > Page table level is 2M
> >
> > Does this also cause a page fault with size mismatch? If so, we
> > shouldn't try psmash because the rmp entry is already 4K.
> >
> > I see these errors in our tests and I think it may be happening
> > because rmp size is already 4K.
> >
> > [ 1848.752952] psmash failed, gpa 0x191560000 pfn 0x536cd60 rc 7
> > [ 2922.879635] psmash failed, gpa 0x102830000 pfn 0x37c8230 rc 7
> > [ 3010.983090] psmash failed, gpa 0x104220000 pfn 0x6cf1e20 rc 7
> > [ 3170.792050] psmash failed, gpa 0x108a80000 pfn 0x20e0080 rc 7
> > [ 3345.955147] psmash failed, gpa 0x11b480000 pfn 0x1545e480 rc 7
> >
> > Shouldn't we use AND instead of OR in the if statement?
> >
>
> I believe this we can't do, looking at the typical usage case below :
>
> [   37.243969] #VMEXIT (NPF) - SIZEM, err 0xc80000005 npt_level 2,
> rmp_level 2, private 1
> [   37.243973] trying psmash gpa 0x7f790000 pfn 0x1f5d90
>
> This is typically the case with #VMEXIT(NPF) with SIZEM error code, when
> the guest tries to do PVALIDATE on 4K GHCB pages, in this case both the
> RMP table and NPT will be optimally setup to 2M hugepage as can be seen.
>
> Is it possible to investigate in more depth, when is the this case being
> observed:

Yes, I added more logs and I can see that these errors happen when RMP
level is 4K and NPT level is 2M.
psmash fails as expected. I think it is just a log, there is no real
issue but the best is not trying psmash if rmp level is 4K.

> RMP level is 4K
> Page table level is 2M
> We shouldn't try psmash because the rmp entry is already 4K.
>
> Thanks,
> Ashish
>
> > if ((error_code & PFERR_GUEST_SIZEM_MASK) && ...
> >
