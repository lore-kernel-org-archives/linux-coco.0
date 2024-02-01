Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A7A7E0E8
	for <linux-coco@lists.linux.dev>; Thu,  1 Feb 2024 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706805517; cv=none; b=fEa+eURCygM0thQU0RP+eofaRP6pk0M0USttClrgupkeVhE48rLSK6xITr6aNGlvX5gxo7y6mTSth0qUbZTjIwe9jtpJfU6wxCxceWnqMAHApr2jQnLm7cakcR/uySKE9LjX4SzDYtXa5fMLYSxwARNDkmLcZ31L7NoTbaKG03g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706805517; c=relaxed/simple;
	bh=EKKfK1jLKXIPEoqnvWWsPVTEbHgmCxR3CtVMQy6TP7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPobg1A/f5DdLjpjKt/cg1yV8Tnzl3GKW8erUHfSwZekNLD1HAscsCic7gU4dV6PGgX09Iv8sXB8PLYu8lKwSgahP4AQbAUTMld3r0Sph5rebtaqNbF9xxV7BQEPiisnOCw0ySRGjNsO48aHNf4uhk1C0MHg5azQ14X1A7FlELY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OTiNBapQ; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OTiNBapQ"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7d5fce59261so575280241.3
        for <linux-coco@lists.linux.dev>; Thu, 01 Feb 2024 08:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706805515; x=1707410315; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxydBSYt78Q3tDYYvbfwJIQv5drJs2GhS3kKeICFZ4k=;
        b=OTiNBapQ4gAb5Q/ZiTco7H/HQEXZ707QBtcbkWEmeMxHbCCmjpzSAGQoNHcAJq/uu+
         yHh/VfVMcbuBrtMJqd7/ic1pKn69e95T13o/2lgIj/0pDb82JanZ5uAauBVRnXNErEhA
         g8Qz9AvULfOzAyJRfT94eRMZs1J/Yvwt8JA2lMdSRJoGTyPkufWH6OcSnSppwCAI0+20
         L6zgE15ooyuqox1dQIxajO0LsKc5adxon4aoZ/UdjiztKw5ii14dscW10QNfPn/VV05U
         m7catyN8qI52swzu9aCI1Z61+pLMDTayPXt8DK7mJ1GAmLQezCKqU4B4q9te+oEIhQ4C
         XCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706805515; x=1707410315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxydBSYt78Q3tDYYvbfwJIQv5drJs2GhS3kKeICFZ4k=;
        b=qT7gP5nkIobP39vL4b9bjRiRKgughn8C3PmWL3CcK+l5MyogHgRMSC6xl3pXRxL8BJ
         QODsscbYZlYbkUlEXHKbfm1m4GlLzGSmOVGGnQsCk+G2CxjAED3x+uZ4iEabuDAx90+c
         LTuzZ2l0nSGhU7CIcOXgW8eoCCwh9PQpny15ia9rFJtpC1EtenEqqHHfFfp/KdOnujuM
         nXU7nsEJ/w9OcB/PjLxgqts2brDnhR/3dl2p4lA9qXCC4JRf/5ry8jd5U7PhhdsEBqQ/
         nTdmAY6/M6Zg6JeYtTZZmZjqjq5yTnHGgfE0gskCZDPpMAIDh2i1uivTBoPkMJiT4OxO
         LJuw==
X-Gm-Message-State: AOJu0YxHFXYbqwGsejBdhewFeShWPBvv792Mth9mZynWXvUz8lR7MU21
	SEE3q9vjbi3qXz3EpRnxDm4IEgu1cEJiwKMqSRkzV1rg7tBB5sSMyjLooZMy8P0yjyyzf+CReh+
	X1pZsGcvcpVQSxgm4v7IxsGvmVsG67Q5Il1/8
X-Google-Smtp-Source: AGHT+IFvLBp7+wMbKBKxwjYgXGrG962W6VY58iu9bhsBfRyOqGFPu3+P1yJI2ZKLHaKwekY3Mc56N8uf1sMgdb+Cosg=
X-Received: by 2002:ac5:cb6b:0:b0:4b6:c3ae:97f6 with SMTP id
 l11-20020ac5cb6b000000b004b6c3ae97f6mr4498112vkn.0.1706805514702; Thu, 01 Feb
 2024 08:38:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
 <20240130220845.1978329-3-kevinloughlin@google.com> <sx3i6e6rgggh6wxtqt6odvwubg5vqotfleyjditiicjvjgpf6r@bswwhdt6zzti>
In-Reply-To: <sx3i6e6rgggh6wxtqt6odvwubg5vqotfleyjditiicjvjgpf6r@bswwhdt6zzti>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Thu, 1 Feb 2024 08:38:23 -0800
Message-ID: <CAGdbjmKOwRbWa9w3M6NH-gTnTOt-ZaM0UA700TMhFzrX8z5MVw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86/head64: Replace pointer fixups with RIP_RELATIVE_ADDR()
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Pankaj Gupta <pankaj.gupta@amd.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Michael Roth <michael.roth@amd.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-coco@lists.linux.dev, Ashish Kalra <ashish.kalra@amd.com>, 
	Andi Kleen <ak@linux.intel.com>, Adam Dunlap <acdunlap@google.com>, 
	Peter Gonda <pgonda@google.com>, Jacob Xu <jacobhxu@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 12:24=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Tue, Jan 30, 2024 at 10:08:45PM +0000, Kevin Loughlin wrote:
> > @@ -594,15 +579,15 @@ static void set_bringup_idt_handler(gate_desc *id=
t, int n, void *handler)
> >  /* This runs while still in the direct mapping */
> >  static void __head startup_64_load_idt(unsigned long physbase)
> >  {
> > -     struct desc_ptr *desc =3D fixup_pointer(&bringup_idt_descr, physb=
ase);
> > -     gate_desc *idt =3D fixup_pointer(bringup_idt_table, physbase);
> > +     struct desc_ptr *desc =3D RIP_RELATIVE_ADDR(bringup_idt_descr);
> > +     gate_desc *idt =3D RIP_RELATIVE_ADDR(bringup_idt_table);
> >
> >
> >       if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT)) {
> >               void *handler;
> >
> >               /* VMM Communication Exception */
> > -             handler =3D fixup_pointer(vc_no_ghcb, physbase);
> > +             handler =3D RIP_RELATIVE_ADDR(vc_no_ghcb);
> >               set_bringup_idt_handler(idt, X86_TRAP_VC, handler);
> >       }
> >
>
> Looks like you removed all physbase users in the function. No need to pas=
s
> it to it.

Thanks, will fix.

>
> > @@ -629,7 +614,7 @@ void early_setup_idt(void)
> >  void __head startup_64_setup_env(unsigned long physbase)
> >  {
> >       /* Load GDT */
> > -     startup_gdt_descr.address =3D (unsigned long)fixup_pointer(startu=
p_gdt, physbase);
> > +     startup_gdt_descr.address =3D (unsigned long)RIP_RELATIVE_ADDR(st=
artup_gdt);
> >       native_load_gdt(&startup_gdt_descr);
> >
> >       /* New GDT is live - reload data segment registers */
>
> With startup_64_load_idt() fixed, no users for physbase in this function
> either.

Ditto.
