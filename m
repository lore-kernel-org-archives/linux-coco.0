Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FDF110C
	for <linux-coco@lists.linux.dev>; Tue, 14 Jun 2022 16:30:24 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id s10so10320084ljh.12
        for <linux-coco@lists.linux.dev>; Tue, 14 Jun 2022 09:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1L/1V22FQTP6Uf5RjDMsd5iGn20Bp4Z0qQsZlN/wiJ8=;
        b=qFmR7YNLv7Th4BWm9n4sQfAo/PamFEtFIgQo01hMs9y/guIfaSpbzw30kSsZXq7LPM
         RYUpHNijz3++3idrKi0BGIZCrd1Bbpr1Vg8xXkBD2vZkOg8647Nog/rnDpzhNQMjXK0a
         jhUI/35a1v6xe8BkqWXX0aeSASjUJCpyj2Leoj78w7CQFxDVvyZY3pMB7TufCV6tzuP4
         khzu9tkF0h44QUyRaG1Sm+qr0ov6IKXX3MYEJg70A8Y7Nu9W5B/ieOGkqOAXbfc1Qatr
         cvb7o0Z42kszhW4WBh9cD2Lb8poWxCGMv9Nf2A3RfMGcxE1siyVeHVITwdjWJnE2pIGO
         AKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1L/1V22FQTP6Uf5RjDMsd5iGn20Bp4Z0qQsZlN/wiJ8=;
        b=eUkYsJiVk2MewRxAG0V6uMgEvnQSp88ruie2dKaoqa3+4J4BQOQwSkxm2lZGWPwFot
         rvyE+/RsN7Xe8WN3A7CLaoTT46H/7KmjSIloMnr7mvT7GwipCFYlHzb4C6EJPtUNvnyK
         pbhvs0VrjDj9bdgff2najE9qjCWYI8RA5/XIjGcwusKjN0XkDncd/X28W+GJN07UExw7
         p5mOgsnZSVXUgfrjXlX6U1Dr9e1/050ZK3WIAzWGPf2w9c8LxWHyHsWzB1C/RpZh2bAQ
         BIe0UIMnvk3RqHE4ClkQzCaWK/Ed/Uh4InolHrGI3SpyqSZ7kW8StD9yJ5txGjUNyS5V
         jKbA==
X-Gm-Message-State: AJIora/tLBtGq+dpzFMjdF4QWdxs6Z33oiDOoX9GAPI30op9SjgtkQzt
	IJ6P89q0/kIJunHcXdUEh+7vXSJJzN6lQALChlfb6Q==
X-Google-Smtp-Source: AGRyM1sXkdL6F3UxQDR1IpYSIwCUEIYSsIKYF3dhzvxGHYLHjBrGqHpA9z6W1AX4rxA3/TU3jTaVyHvpkX1iAdgZL04=
X-Received: by 2002:a2e:a385:0:b0:259:ac23:8d15 with SMTP id
 r5-20020a2ea385000000b00259ac238d15mr926331lje.278.1655224221833; Tue, 14 Jun
 2022 09:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210820155918.7518-1-brijesh.singh@amd.com> <20210820155918.7518-24-brijesh.singh@amd.com>
 <CABpDEukdrEbXjOF_QuZqUMQndYx=zVM4s2o-oN_wb2L_HCrONg@mail.gmail.com>
 <1cadca0d-c3dc-68ed-075f-f88ccb0ccc0a@amd.com> <CABpDEun0rjrNVCGZDXd8SO3tfZi-2ku3mit2XMGLwCsijbF9tg@mail.gmail.com>
 <ee1a829f-9a89-e447-d182-877d4033c96a@amd.com> <CAMkAt6q3otA3n-daFfEBP7kzD+ucMQjP=3bX1PkuAUFrH9epUQ@mail.gmail.com>
 <SN6PR12MB27671CDFDAA1E62AD49EC6C68EAA9@SN6PR12MB2767.namprd12.prod.outlook.com>
In-Reply-To: <SN6PR12MB27671CDFDAA1E62AD49EC6C68EAA9@SN6PR12MB2767.namprd12.prod.outlook.com>
From: Peter Gonda <pgonda@google.com>
Date: Tue, 14 Jun 2022 10:30:10 -0600
Message-ID: <CAMkAt6r0ZsjS_XtVYnazC8-Z9bHQafLZ7QFq2NqcRQ2gZbUyPg@mail.gmail.com>
Subject: Re: [PATCH Part2 v5 23/45] KVM: SVM: Add KVM_SNP_INIT command
To: "Kalra, Ashish" <Ashish.Kalra@amd.com>
Cc: Alper Gun <alpergun@google.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kvm list <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	"Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Sergio Lopez <slp@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	"Roth, Michael" <Michael.Roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, 
	Tony Luck <tony.luck@intel.com>, Marc Orr <marcorr@google.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Pavan Kumar Paluri <papaluri@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 10:11 AM Kalra, Ashish <Ashish.Kalra@amd.com> wrote=
:
>
> [AMD Official Use Only - General]
>
>
> -----Original Message-----
> From: Peter Gonda <pgonda@google.com>
> Sent: Tuesday, June 14, 2022 10:38 AM
> To: Kalra, Ashish <Ashish.Kalra@amd.com>
> Cc: Alper Gun <alpergun@google.com>; Brijesh Singh <brijesh.singh@amd.com=
>; Kalra, Ashish <Ashish.Kalra@amd.com>; the arch/x86 maintainers <x86@kern=
el.org>; LKML <linux-kernel@vger.kernel.org>; kvm list <kvm@vger.kernel.org=
>; linux-coco@lists.linux.dev; linux-mm@kvack.org; Linux Crypto Mailing Lis=
t <linux-crypto@vger.kernel.org>; Thomas Gleixner <tglx@linutronix.de>; Ing=
o Molnar <mingo@redhat.com>; Joerg Roedel <jroedel@suse.de>; Lendacky, Thom=
as <Thomas.Lendacky@amd.com>; H. Peter Anvin <hpa@zytor.com>; Ard Biesheuve=
l <ardb@kernel.org>; Paolo Bonzini <pbonzini@redhat.com>; Sean Christophers=
on <seanjc@google.com>; Vitaly Kuznetsov <vkuznets@redhat.com>; Wanpeng Li =
<wanpengli@tencent.com>; Jim Mattson <jmattson@google.com>; Andy Lutomirski=
 <luto@kernel.org>; Dave Hansen <dave.hansen@linux.intel.com>; Sergio Lopez=
 <slp@redhat.com>; Peter Zijlstra <peterz@infradead.org>; Srinivas Pandruva=
da <srinivas.pandruvada@linux.intel.com>; David Rientjes <rientjes@google.c=
om>; Dov Murik <dovmurik@linux.ibm.com>; Tobin Feldman-Fitzthum <tobin@ibm.=
com>; Borislav Petkov <bp@alien8.de>; Roth, Michael <Michael.Roth@amd.com>;=
 Vlastimil Babka <vbabka@suse.cz>; Kirill A . Shutemov <kirill@shutemov.nam=
e>; Andi Kleen <ak@linux.intel.com>; Tony Luck <tony.luck@intel.com>; Marc =
Orr <marcorr@google.com>; Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppu=
swamy@linux.intel.com>; Pavan Kumar Paluri <papaluri@amd.com>
> Subject: Re: [PATCH Part2 v5 23/45] KVM: SVM: Add KVM_SNP_INIT command
>
> On Mon, Jun 13, 2022 at 6:21 PM Ashish Kalra <ashkalra@amd.com> wrote:
> >
> >
> > On 6/13/22 23:33, Alper Gun wrote:
> > > On Mon, Jun 13, 2022 at 4:15 PM Ashish Kalra <ashkalra@amd.com> wrote=
:
> > >> Hello Alper,
> > >>
> > >> On 6/13/22 20:58, Alper Gun wrote:
> > >>> static int sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd
> > >>> *argp)
> > >>>>    {
> > >>>> +       bool es_active =3D (argp->id =3D=3D KVM_SEV_ES_INIT || arg=
p->id
> > >>>> + =3D=3D KVM_SEV_SNP_INIT);
> > >>>>           struct kvm_sev_info *sev =3D &to_kvm_svm(kvm)->sev_info;
> > >>>> -       bool es_active =3D argp->id =3D=3D KVM_SEV_ES_INIT;
> > >>>> +       bool snp_active =3D argp->id =3D=3D KVM_SEV_SNP_INIT;
> > >>>>           int asid, ret;
> > >>>>
> > >>>>           if (kvm->created_vcpus) @@ -249,12 +269,22 @@ static
> > >>>> int sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp)
> > >>>>                   return ret;
> > >>>>
> > >>>>           sev->es_active =3D es_active;
> > >>>> +       sev->snp_active =3D snp_active;
> > >>>>           asid =3D sev_asid_new(sev);
> > >>>>           if (asid < 0)
> > >>>>                   goto e_no_asid;
> > >>>>           sev->asid =3D asid;
> > >>>>
> > >>>> -       ret =3D sev_platform_init(&argp->error);
> > >>>> +       if (snp_active) {
> > >>>> +               ret =3D verify_snp_init_flags(kvm, argp);
> > >>>> +               if (ret)
> > >>>> +                       goto e_free;
> > >>>> +
> > >>>> +               ret =3D sev_snp_init(&argp->error);
> > >>>> +       } else {
> > >>>> +               ret =3D sev_platform_init(&argp->error);
> > >>> After SEV INIT_EX support patches, SEV may be initialized in the pl=
atform late.
> > >>> In my tests, if SEV has not been initialized in the platform yet,
> > >>> SNP VMs fail with SEV_DF_FLUSH required error. I tried calling
> > >>> SEV_DF_FLUSH right after the SNP platform init but this time it
> > >>> failed later on the SNP launch update command with
> > >>> SEV_RET_INVALID_PARAM error. Looks like there is another
> > >>> dependency on SEV platform initialization.
> > >>>
> > >>> Calling sev_platform_init for SNP VMs fixes the problem in our test=
s.
> > >> Trying to get some more context for this issue.
> > >>
> > >> When you say after SEV_INIT_EX support patches, SEV may be
> > >> initialized in the platform late, do you mean sev_pci_init()->sev_sn=
p_init() ...
> > >> sev_platform_init() code path has still not executed on the host BSP=
 ?
> > >>
> > > Correct, INIT_EX requires the file system to be ready and there is a
> > > ccp module param to call it only when needed.
> > >
> > > MODULE_PARM_DESC(psp_init_on_probe, " if true, the PSP will be
> > > initialized on module init. Else the PSP will be initialized on the
> > > first command requiring it");
> > >
> > > If this module param is false, it won't initialize SEV on the
> > > platform until the first SEV VM.
> > >
> > Ok, that makes sense.
> >
> > So the fix will be to call sev_platform_init() unconditionally here in
> > sev_guest_init(), and both sev_snp_init() and sev_platform_init() are
> > protected from being called again, so there won't be any issues if
> > these functions are invoked again at SNP/SEV VM launch if they have
> > been invoked earlier during module init.
>
> >That's one solution. I don't know if there is a downside to the system f=
or enabling SEV if SNP is being enabled but another solution could be to ju=
st directly place a DF_FLUSH command instead of calling sev_platform_init()=
.
>
> Actually sev_platform_init() is already called on module init if psp_init=
_on_probe is not false. Only need to ensure that SNP firmware is initialize=
d first with SNP_INIT command.

But if psp_init_on_probe is false, sev_platform_init() isn't called
down this path. Alper has suggested we always call sev_platform_init()
but we could just place an SEV_DF_FLUSH command instead. Or am I still
missing something?

>
> Thanks,
> Ashish
