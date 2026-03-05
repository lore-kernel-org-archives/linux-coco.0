Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF0246BC5
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772730494; cv=none; b=PG3pPfdGjUALd9Svs+zHu5CWeglOPxJSTCdh5hh7MhBZsC7CNnY0u6HBtlKyGgNxPJPpLqGgDofMr6WYdm4qYbQa5T1Qj5Shs0vmvTa7XDjLHr+ZLXcd7z0cFv6F3mdFWs6xFETRvBAGyQ+SuufLokGOKEBlWZQFL2bs68cZ1K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772730494; c=relaxed/simple;
	bh=44Wf9yR+9fDTpGBd7gaALr0VRFJXcbdH1Kh7ijRReg4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=acUokKT88fre5bpOsqBAEmFRpDbRthinFX6A9UzzxLgaHDpmYXwsZDqfH8/+FjRKjx2LHik4PC0onyVoAvNsxwIaWm/FulaKkwG6QvbTTbUrxv51gNcUaVj0MMlkRbN31Bf3d9cXGeEpMNm8KrS5gU3cYVLeqAxQaOpQmL43xgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cUnmYVqG; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cUnmYVqG"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c73887d0297so703999a12.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Mar 2026 09:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772730493; x=1773335293; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AxBmwvv5FcFM26s9KrWq4WE50z12Fbkxw/Cz6Wssdg=;
        b=cUnmYVqGnapAQQZiHMY+9MxHHLOq7hxKqig7QlCD6XXjmorphnSa+3SmyiDLGEhjHx
         ddgIDFvp1lDjy9D0fp8ZJE7XzNiM5S5CJOX35/tnfzEjVBjxVqcrZXQInnK35d0xUZXo
         Ful/17qmkrfGMZ/8+RYVkpLBAXwVzdDvfX3e0hwE2sebHRTbKJO+asjbeCyN/Do3T1PQ
         7v6B/EeBVl+b4T91uxWIlM+Mk39tvkqmY8jHJGoc+WI/nsAW3Hy2NJSMjSb6ua+L9xzB
         7BcQFiqARYXv0eoadlhNB3rfMfw/o9hlC95JQLqrbyqMKKmCmaLSBE5pFPS+UbGPyFs7
         2XFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730493; x=1773335293;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1AxBmwvv5FcFM26s9KrWq4WE50z12Fbkxw/Cz6Wssdg=;
        b=gTpG8jA8F4Qyfpr03QrmcsapbtfhHfwAALuEywBUNPhHuxFY4XLVOqQRX3MVeF5LD2
         KaHWem3umebmF7ijhFAf+7gITvJSwENUNTDJV1pm5WyHItKcMzjLv8uxSM658udJ5zKt
         qSQX64mhlZVKYedMbaWzF8tP1I94BVBiAqcKVsli/10cyo1+MRL0N4POn7eV/GMqKMxx
         LyFZGDU81Aqi7ymIxPJzVV3M8JQdoYjwJK7UKmWL/80L1Vm47M/+9mBpZ93saDlESeWA
         MCYIUjZL9fqPo58OhTpk6/dmqZEIZCrFLospRB3aeHZqXMn1h3i+iZgzXfBVl8Lz28Ng
         cQ0g==
X-Gm-Message-State: AOJu0Yy6XPuijBtk9CaZa0bw4wwk2Fl4Nxif5qtJVp2yAGXP4k/TeyPh
	qpFEBJ6u7h/Z+6UUjMBb7t3YOEwNES4JfhC6yCLeMzIAP6HP/uWBaaBPIZiEnT+hMOmcXdoOcuS
	VjOTTXg==
X-Received: from pgq25.prod.google.com ([2002:a63:1059:0:b0:c73:7970:8223])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3a42:b0:395:151c:4eda
 with SMTP id adf61e73a8af0-3982e19b424mr6273616637.45.1772730492955; Thu, 05
 Mar 2026 09:08:12 -0800 (PST)
Date: Thu,  5 Mar 2026 09:07:27 -0800
In-Reply-To: <20260209153108.70667-2-clopez@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260209153108.70667-2-clopez@suse.de>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <177273040463.1572329.15040370332161552034.b4-ty@google.com>
Subject: Re: [PATCH v2] KVM: x86: synthesize CPUID bits only if CPU capability
 is set
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, bp@alien8.de, kvm@vger.kernel.org, 
	"=?UTF-8?q?Carlos=20L=C3=B3pez?=" <clopez@suse.de>
Cc: linux-coco@lists.linux.dev, jmattson@google.com, binbin.wu@linux.intel.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 09 Feb 2026 16:31:09 +0100, Carlos L=C3=B3pez wrote:
> KVM incorrectly synthesizes CPUID bits for KVM-only leaves, as the
> following branch in kvm_cpu_cap_init() is never taken:
>=20
>     if (leaf < NCAPINTS)
>         kvm_cpu_caps[leaf] &=3D kernel_cpu_caps[leaf];
>=20
> This means that bits set via SYNTHESIZED_F() for KVM-only leaves are
> unconditionally set. This for example can cause issues for SEV-SNP
> guests running on Family 19h CPUs, as TSA_SQ_NO and TSA_L1_NO are
> always enabled by KVM in 80000021[ECX]. When userspace issues a
> SNP_LAUNCH_UPDATE command to update the CPUID page for the guest, SNP
> firmware will explicitly reject the command if the page sets sets these
> bits on vulnerable CPUs.
>=20
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: x86: synthesize CPUID bits only if CPU capability is set
      https://github.com/kvm-x86/linux/commit/6a5028d8f9f4

--
https://github.com/kvm-x86/linux/tree/next
