Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0B4391838
	for <linux-coco@lists.linux.dev>; Mon, 18 May 2026 20:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779137473; cv=none; b=tOK+p+unoTuNM2luYTHORHnvkkSN/P54tYYoaIuORxBi9VBAdqXJCzzRXQT3tAMHn8Tzo2FfSR/FlYI9cf0uHxMLum7YMmZnpPelaFkhRxxai65Lg4SDmtuFUgKsoq5oqYA1hjpKzgA04i24Y5FMysQ70dwi34bqqMAkKjLwaw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779137473; c=relaxed/simple;
	bh=Y/k/A8rQYJuIoEDWTkWkJu7sDQNtQX63mbCefOQE59k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HXNq/vGmEbfZopJeWYNhOCzC1TUtIetZMYppJrgH1+w9FGdZfS+Hf2cYNo6iPRWtW33JM09EXq34yOTJj3qrK+UCKKmOFyGagm1iqI+Jmp7h+rOzfKrs7poE0VSgmhGEeDsXt9aGtGd0EEUIgoAGvRV45MepJ/F0nFRLQQrxsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u6x8qOSi; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u6x8qOSi"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso1676764b3a.1
        for <linux-coco@lists.linux.dev>; Mon, 18 May 2026 13:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779137471; x=1779742271; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdrFK7KwVl/zk51lMHH0xrd4K1s2WYKbl4YNCQ/z3AA=;
        b=u6x8qOSiK4ZKLffE21GYxZb7yiihnQ2x0W1lgULs95Pj2xC4iiJy+16LhvR6btPdCQ
         RYPRUr713HpI5B29+EQsQWze9K3MASwX1c+4upcsT67Mc+cj0d0/QK7emmX4gw6MnCCj
         15OCBZWnIEBNTxAeuSQTtdUQVkLJKa802KXWsFHLcrO2m9vBpiMfM4TJazdT8Zhn7EvD
         PmeR12CDfjbbRVHsQbLdK8thQnzbUGYSLJG05Ga7x1tjydeRjXtzsPx5KnSC+aUzJfN5
         mYeJOnTsXjrJfMjWjQZ6GPldqHpCBmpkvuSLbOETU8DxrQY6l3xDxyeFCTJDOF6gZMou
         sXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779137471; x=1779742271;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xdrFK7KwVl/zk51lMHH0xrd4K1s2WYKbl4YNCQ/z3AA=;
        b=nUFm/+5IjhxSAADmYyN0h2l7Mi7Fn7JCN+oL7KSz1nlD9G6nIOictBupar1/0fKV8h
         abTfzYXkjOckJQ6iOQvSGWsiMNHiT5dLKJZYCBQgx48vKsfp2zdns1SB9Vybn6SxfERQ
         CD8SPp6SQU5CG5lEffViXX8umLLgdukrTtQUTAUdw5QzU1v37Utx00f5gVqewMioVw0g
         Q119CMjpL+WVExqsWjTThysY0eG0KhkFXoAITc8On6Q7gf77I6vnqPjhk1xlMZS8f/4t
         tLmvaADzYLS0yZKdQiDOZu0V2g8E2nZCLXvdnH7pkjdPjbJpcjreTRs5rgHDPQKzh2F8
         Z+bw==
X-Forwarded-Encrypted: i=1; AFNElJ8mb9AnV8t7H2jbsDt2qyN+N7QcJAAVHzVlXhVcD3PlTe5dJW7w48zQCr5yjGbhIXYTNBI9wxYkVqov@lists.linux.dev
X-Gm-Message-State: AOJu0YybDdrU7Jyx3aVhUSGrqavgVU597LN7hY2Bn10oz0d7wIhu0uxq
	wg3rK3u9D59FKYRNRu9RNsx9FXlIoE28hFE8WSFX1tY/Z31rc9Zw6gP6tYx4b2eGVR2+RJr2FJN
	5RbJ0lA==
X-Received: from pfbg7.prod.google.com ([2002:a05:6a00:ae07:b0:837:c09c:9cce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2793:b0:83e:26b:528c
 with SMTP id d2e1a72fcca58-83f33d26f67mr16065245b3a.28.1779137470943; Mon, 18
 May 2026 13:51:10 -0700 (PDT)
Date: Mon, 18 May 2026 13:51:10 -0700
In-Reply-To: <136d277dba2ac681ed7607a436f55e2fd1975ec5.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com> <20260514215355.1648463-9-seanjc@google.com>
 <136d277dba2ac681ed7607a436f55e2fd1975ec5.camel@intel.com>
Message-ID: <agt7vnVL5rJJUVzo@google.com>
Subject: Re: [PATCH v2 08/15] KVM: x86: Add mode-aware versions of
 kvm_<reg>_{read,write}() helpers
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "kas@kernel.org" <kas@kernel.org>, 
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "paul@xen.org" <paul@xen.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "yosry@kernel.org" <yosry@kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026, Kai Huang wrote:
>=20
> > @@ -10413,29 +10413,30 @@ static int complete_hypercall_exit(struct kvm=
_vcpu *vcpu)
> > =C2=A0
> > =C2=A0	if (!is_64_bit_hypercall(vcpu))
> > =C2=A0		ret =3D (u32)ret;
> > -	kvm_rax_write(vcpu, ret);
> > +	kvm_rax_write_raw(vcpu, ret);
> > =C2=A0	return kvm_skip_emulated_instruction(vcpu);
> > =C2=A0}
> >=20
>=20
> Nit:  AFAICT if we use kvm_rax_write(vcpu, ret) instead of the "raw" vers=
ion
> here, we can then remove the
>=20
> 	if (!is_64_bit_hypercall(vcpu))
> 		ret =3D (u32)ret;

No, because sneakily, is_64_bit_hypercall() !=3D is_64_bit_mode(vcpu).  And=
 because
we also need to avoid calling is_64_bit_mode().  If we use kvm_rax_write(),=
 then
the unpacked code will be:

	WARN_ON_ONCE(vcpu->arch.guest_state_protected);

	if (is_long_mode(vcpu))
		kvm_x86_call(get_cs_db_l_bits)(vcpu, &cs_db, &cs_l);
	else
		cs_l =3D 0;

	if (cs_l)
		vcpu->arch.regs[VCPU_REGS_RAX] =3D ret;
	else=09
		vcpu->arch.regs[VCPU_REGS_RAX] =3D (u32)ret;

whereas the (correct) behavior here is:

	if (vcpu->arch.guest_state_protected)
		cs_l =3D 1;
	else if (is_long_mode(vcpu))
		kvm_x86_call(get_cs_db_l_bits)(vcpu, &cs_db, &cs_l);
	else
		cs_l =3D 0;

	if (cs_l)
		vcpu->arch.regs[VCPU_REGS_RAX] =3D ret;
	else=09
		vcpu->arch.regs[VCPU_REGS_RAX] =3D (u32)ret;

I.e. using the non-raw version will trigger the WARN_ON_ONCE(), and will in=
correctly
truncate "ret" whenever cs_l is stale (which might be always?).
