Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA9F3F9C5
	for <linux-coco@lists.linux.dev>; Wed, 20 Nov 2024 04:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732078555; cv=none; b=ckOzETkBHXaRiXL5j2BmhjyYKj3aLJTB7c3FWdZDC+9LhpuacC73hN/tHsE0HuvbI07CSeojCyi10R+d2URAgKwTAdcSVFS+S6UgqGWFKBrJpZ3kI6C/ygo2SvlU7Hdm1HLGq5kY9Xq9XEu57nABkE6eoTvprOZiLpt+n9DI9KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732078555; c=relaxed/simple;
	bh=qidyDdoPMSrLqOEPcAD7Fm10v61MJZnJnKYjl/6vk68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxBoUeDFHBCAl5ahJB2ufcTDzqFAOczUAg5tn+8lKClfngaV/8ZS64nPmcR/CyPqbZIdM6W0p9i7t1+6MWYpPqSLDzewOpcgV5ixjyBFjRliA047/lbprHOTyJuA5+aBXiJEtbMnLDqyXFmkglY2Qap11Fi8B8YvmpDPhJiujk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uSjitzdE; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uSjitzdE"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso893377466b.1
        for <linux-coco@lists.linux.dev>; Tue, 19 Nov 2024 20:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732078552; x=1732683352; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLsyLORpZtZ6b2mAwzZkeZQ6i4pKu4Ce89IT06ouUsE=;
        b=uSjitzdED3ftX5xuHt9V1H3sXyEcFts1/Rk0qntqzoudJeHuNBzLYvddIhYVjJU7ti
         8FrfUN7R+OfUTBzmVTruLBgG10C04kCC/GBLgBNEHm1OvXTQDhh/NWLwUYzwUi9mueBg
         jbQi35R/I8dPCPb4TI/UaW52ltVaORhPFLuSr7QmGdjumNeXlzSrhLBdw2QtaStj81Xj
         3dlQFBhjyLly9ZpPlispMo2fJCqJyxbqG6UEXnFUFIzd0hFcixfkn2bmofnTngge0fj6
         r5DuA0yjdH6o6LMkAdO7jEpUY5p28SzlAHJNyNpEZOzuux8j0PivKSVWkDuoXY0eKUwa
         ecEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732078552; x=1732683352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLsyLORpZtZ6b2mAwzZkeZQ6i4pKu4Ce89IT06ouUsE=;
        b=urA+d4OyXUN8VfL16+gK4T/2bfuaSrU9hDDq+MsQp7sW8oMNATeyD2rZYF26nQXGPt
         P7MbkkaIcZWFBgAiaLWxwf7mWJ/eClBy5j22+RLza1Nr+8a24Mk2qoqJFmkUWQ82VvIr
         hbGKrZP1LbQwi+kjH9pWNKDuSu7rI4CG6b/T9cQjofga/usu/gzntiMCBLQtiGq92PFx
         4c1ObSSUh7NhTe6YgaCJvXipYiBH/weamqjYM+tEH4dFdIKMU90UolRUvJ3eDSrqT1Dm
         mHOZxOtQ//cp5O0k1qoeqgmx9SYyjKA+ao6ixEj7e6gsLhGnPRHAZ5vtx6kRX4s/8O03
         qvfw==
X-Forwarded-Encrypted: i=1; AJvYcCUEbjL9ZN5442g7PEIng8PfE2JCL9Pgi+a3hEOtlg7sg+Ibd2Ylic+rEhKp6Bs1YJiVwFrY1ScL7coI@lists.linux.dev
X-Gm-Message-State: AOJu0YzAqluEKYPnrBerlykW5Wub1+wOEr8BfGzknOoSrPNHawh4zJwJ
	j+A6/Jie5+e/KnZ6lxlYDzJlZ5GV3o3Yh0XaRGH4g6PkVmjBJyygf/UlG1BYsUKa8Yj/EmUK0+6
	rfY0R4ualk8Y2PHn4HZSejM6uhfw89Ng8rSX+
X-Google-Smtp-Source: AGHT+IGineP2bUXtNwD1Ct4msCtFonm9FZ5ffyQckr3P3Efc8YypLgUph8KTFI3sRkQXjSxM5eevi7MkccDQbnEgqmo=
X-Received: by 2002:a17:907:961e:b0:aa4:777d:7394 with SMTP id
 a640c23a62f3a-aa4dd52feabmr116533166b.11.1732078552227; Tue, 19 Nov 2024
 20:55:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241119133513.3612633-1-michael.roth@amd.com>
 <20241119133513.3612633-2-michael.roth@amd.com> <CAAH4kHZ_A7-dNyMiyrZ2p46te=Xi7SRosS_kSjYvG6sJTcmb7A@mail.gmail.com>
In-Reply-To: <CAAH4kHZ_A7-dNyMiyrZ2p46te=Xi7SRosS_kSjYvG6sJTcmb7A@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 19 Nov 2024 20:55:40 -0800
Message-ID: <CAAH4kHYncFsa=5NZVX35jk3jicx1fnYTHsLwapHmJ03+TNKa9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: Introduce KVM_EXIT_COCO exit type
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, jroedel@suse.de, thomas.lendacky@amd.com, 
	pgonda@google.com, ashish.kalra@amd.com, bp@alien8.de, pankaj.gupta@amd.com, 
	liam.merwick@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 8:54=E2=80=AFPM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> On Tue, Nov 19, 2024 at 5:51=E2=80=AFAM Michael Roth <michael.roth@amd.co=
m> wrote:
> >
> > +struct kvm_exit_coco {
> > +#define KVM_EXIT_COCO_REQ_CERTS                0
> > +#define KVM_EXIT_COCO_MAX              1
> > +       __u8 nr;
> > +       __u8 pad0[7];
> > +       __u32 ret;
> > +       __u32 pad1;
> > +       union {
> > +               struct {
> > +                       __u64 gfn;
> > +                       __u32 npages;
>
> Should this not also include a vmm_err code to report to the guest? We
> need some way for user space to indicate that KVM should write the
> vmm_err to the upper 32 bits of exit_info_2.
> I don't think we have a snapshot of the GHCB accessible to userspace.
>
> I'm still not quite able to get a good test of this patch series
> ready. Making the certificate file accessible to the VMM process has
> been unfortunately challenging due to how we manage chroots and VMM
> upgrades.
> Still, I'm stuck in the VMM implementation of grabbing the file lock
> for the certificates and asking myself "how do I tell KVM to write
> exit_info_2 =3D (2 << 32) | (exit_info_2 & ((1 << 32)-1) before entering
> the guest?"
> A __u32 vmm_err field of this struct would nicely make its size 64-bit al=
igned..

retracted. I needed to look 2 lines lower. I need to stop working this late=
.
>
> --
> -Dionna Glaze, PhD, CISSP, CCSP (she/her)



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
