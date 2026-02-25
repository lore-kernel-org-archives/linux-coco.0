Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC263D4129
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 19:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772047378; cv=none; b=HAy+iGWCfO2zYPmQXQm42rlXfCdzTBX23Lyi2tLDQDXHPAW9yzE/cHwLl8YCJJj94AOH+08CWOo67jFXm7Nd+8uF6o1SYIDL/apLgbAXzGDEUzohOV2Qpo0TQq5yu+MwKUrEeg9GyeMIWF77POCr7AhrGoZHjSVUWDc+gYUiVRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772047378; c=relaxed/simple;
	bh=hdbt2gJkdJI1X/bk9bWaKI1byIhBqpu3nOa+BwPD3Qs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gzsWzunm/xV3ikiotnjhIiOzH3XwPrTaUs3WJ+kP39lEiMHYo0ktOPi4kOYL+EmxbM1uoaDMGkDymJfFPUdIcs9dhK9IKIE87bhcOP7qN8QW2yJa5gFsHWfQiWaZsZ+Y6sR56Iah0XkQ6tEBmq1vcjiot+XTC6dYRfGuUXqTMhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o1S2XAu5; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o1S2XAu5"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354c0eb08ceso43005125a91.1
        for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 11:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772047377; x=1772652177; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkgOtQvbHz735PaP9GU0CKR7oczRQkq04nK8VZg21mE=;
        b=o1S2XAu5Tzofec0NiHPsJUe+aMV7TVUpcFQVVN+05MVtheJJpkrRho/236eUpSPJ8S
         yP/Jhr6jPQ4dY1po5MRClSniXoNHbmzq+hiEmW0mhGWMT5XhLhWttw1eHwzXzOdH8EMC
         b8w3UtZx47XJUWQ7VTJhu8+fO1bq98FDCY7HiZnYFdRSsPnCM+YlVGsYDZSPw57/61CZ
         Cl6sC7vUG8b9XSLxtJMj5JHv/D1thHMQjJrUeXb28XvhIczgoFUKFedWPVImWXkyZTki
         fCVJH8p0avuPFkw/DdE1lTvmAHeg580l9blODeXiDAfDqcKOZ0n+6E3c7YImpHLdUnm9
         O0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772047377; x=1772652177;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RkgOtQvbHz735PaP9GU0CKR7oczRQkq04nK8VZg21mE=;
        b=PlE5YJL+TzLv9ygF4/FAP2KnnxcWpgxyYFbL9458kLbpk16mULPMsSSm4LYfdo6OL+
         +AmVS+XNRr0xhsK4thhlH4+nCU32IY1VmPyKgt5rKtZ0NAKEQEgMDcs89KX7AOYswSUn
         cbbZAzQRx3fGBaqMOigtOcmdrGWbokUFZZpqJDEUDXu/XkdENxRYlvRXdk3/Wib3yfUS
         2penXukQ7lxTXRj7wAaMG4K3Rdb9KK4qXqT5i3TCw0/6uYbbove5sWT8GlyT3fbVXkXR
         yMpnWSL9Duofkm3XFV+WLdFT8IeVyiZXsURK/Tl1l/256A0AKtkmpa9fakTlzN5VHWU4
         Yj6g==
X-Forwarded-Encrypted: i=1; AJvYcCVJmjlyjY5OskRY3bUnG5zS3fONiyT2g9FwrS0GZE3zZM64uoBKTgwBShotBkIXKntuyqMdzbpbejFh@lists.linux.dev
X-Gm-Message-State: AOJu0YytsUE+uVBJZdJsBw5tG1CsrdWqI9KxcL056z02yXULQbzBdzZW
	YyJi2qIR5u9LvHhKgwZffT44CQlE6fM9NO2HP8FpKKZ/3K0hxHTW/DJHT9MKdLGyMg6vc5gdr8l
	duPU11g==
X-Received: from pjzs1.prod.google.com ([2002:a17:90b:701:b0:356:3104:ed7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:250f:b0:358:ee5f:9c04
 with SMTP id 98e67ed59e1d1-358ee5f9f15mr3687808a91.30.1772047376873; Wed, 25
 Feb 2026 11:22:56 -0800 (PST)
Date: Wed, 25 Feb 2026 11:22:55 -0800
In-Reply-To: <8bed2406e9f5f30f8f01c1da731fae6e040da827.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com> <20260225012049.920665-15-seanjc@google.com>
 <8bed2406e9f5f30f8f01c1da731fae6e040da827.camel@intel.com>
Message-ID: <aZ9MDxJ1iEhIbJJ6@google.com>
Subject: Re: [PATCH 14/14] KVM: x86: Add helpers to prepare kvm_run for
 userspace MMIO exit
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "kas@kernel.org" <kas@kernel.org>, 
	"x86@kernel.org" <x86@kernel.org>, "zhangjiaji1@huawei.com" <zhangjiaji1@huawei.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "michael.roth@amd.com" <michael.roth@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026, Rick P Edgecombe wrote:
> On Tue, 2026-02-24 at 17:20 -0800, Sean Christopherson wrote:
> > +static inline void __kvm_prepare_emulated_mmio_exit(struct kvm_vcpu *v=
cpu,
> > +						=C2=A0=C2=A0=C2=A0 gpa_t gpa, unsigned int len,
> > +						=C2=A0=C2=A0=C2=A0 const void *data,
> > +						=C2=A0=C2=A0=C2=A0 bool is_write)
> > +{
> > +	struct kvm_run *run =3D vcpu->run;
> > +
> > +	run->mmio.len =3D min(8u, len);
>=20
> I would think to extract this to a local var so it can be used twice.

Ya, either way works for me.  The copy+paste is a little gross, but it's al=
so
unlikely that anyone is going to modify this code (or if they did, that any=
 goofs
wouldn't be immediately disastrous).

> > +	run->mmio.is_write =3D is_write;
> > +	run->exit_reason =3D KVM_EXIT_MMIO;
> > +	run->mmio.phys_addr =3D gpa;
> > +	if (is_write)
> > +		memcpy(run->mmio.data, data, min(8u, len));
> > +}
> > +
>=20
