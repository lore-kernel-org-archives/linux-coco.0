Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EAD34FF79
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 03:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505141; cv=pass; b=ZHFTJWub2cep6mA31gcoh0cWrnylRyKGbVakjG9he6jyino8Y33s1u9QL/c0Kz5xwh6u7mAmieSnPuwfhUFb/T9Dotrskmb+NuyJz4UqLEONX3p0tkiq+9JHnNG8pwf5RuDi5tAf/E0N3luog/E94xgAsRKf1FGc+jllASJ2VWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505141; c=relaxed/simple;
	bh=8eBdffJzIDgLmDfD73g8in+j36Jkh74FeOyl9b2izWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CM/Da8dgkPUU66quIqTLbMx1iq/pHmhNvR7Ia/duKo3J8IMitLSQxxVF7v59wA0uKseYbfHC05EhNtVwwhkMhOQfJiskNpHBhwsHs2/dZpCQmD5vneuty6Q5Z/WhdEcupsHG0BW6TZFr4fQhWfLb+Nln77lOD8C3GwAf0wxLyLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nix0pxWe; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nix0pxWe"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9034b6b7674so4158956d6.0
        for <linux-coco@lists.linux.dev>; Tue, 11 Aug 2026 20:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786505137; cv=none;
        d=google.com; s=arc-20260327;
        b=A2bMUGjmkeKG0PWI8QhYIb/ANNpQI225uKedJQQekUxmrSMo2u4JPmNa/Rk1expnm7
         rI9TYWkD8cUIOprxmgf1wiN5n+BiqmGlpP9Gy3hOqsTm7IYHuXRDAVBjqQ6dqV5DIPe9
         U0mwL+6IYOJ93KshT/BvlWY/DjP0niizkB0PAw1Vj2tMhI5CoiqKvxQc5thaYuK6iH6W
         OfkmCVnve1ijv+dtc2ROQC9OZE27hzT1FUFwN4OG8/zG5fKap9nta1PEJHfybNWPgLl7
         oHlmOsmTVwI24lWkx6rNDoCr1EUwHp5yrRop9nqas/UYu/pwh3wseniu8WLR1Gx99yTm
         JsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sbAE3LPUDSURazUhNIkFniQu501TuI9sZ6Nx1+2SCHw=;
        fh=1Xw71EajsFLjZSUoUAaS5ALk03EH3HM0t7ud6PXb2Dw=;
        b=bZScQJCFBhLcywKaPE7eInT3oDKYExp/xc/iuFpF8bvJZt89HkschLiOjj423lI0K2
         A7ueKteqW8qJZwuSacFkkltEpFh/1tU12aMn5cHJFr2+UdvQ77Am9OlR3snPRDYjzj6O
         B9SgKrXJbpEOoNfWo/EAdI3NoXjCApwp3gk/FZMDVMTRsypfrrCvwtgSm/mn5JSOD4mY
         eu+MyO7eJkV2vC8rNobQxlmRoden6u7+sKlBxTCDAjYIGH+jlRUC5WaIkgIwGnqoJFhb
         7F8A+i+5KZrGvM4aXvXuJezYdd1+jnA6rQoQ/DE4wKdWVjHJELuo9QRKNsFbTXIGHNem
         Whrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786505137; x=1787109937; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbAE3LPUDSURazUhNIkFniQu501TuI9sZ6Nx1+2SCHw=;
        b=nix0pxWeC6M2rU9MdS6lZ7ywmpcaa2N+jz0ztgyK9oY7puMX4mKthzz11dj6bsbJY8
         6IZ/M8PPY3hQIfN/mDSdmjZ7DuS8+7jqfEQgLYeWqIfH4pcRkqLV5W5DJQKTIUY52lau
         ZpKufdNzmXWjaTaMLdCHWxrZhPzw5oRYF2GWw4Bq15r5dxY03MuE815aP5pPfxURHtJT
         VmGX9ILcwms9RNYIAyBz2YweDPWKdscUjfcKFcYY8dguQayxzWA0OuP88JSnJKnMPxxJ
         KSPPRoE5P/War77BLQtOuXyXdCcsps1wRx1bJlX3y9Km6+wpGqFJxLN21rBOOqqRaueK
         5pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786505137; x=1787109937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbAE3LPUDSURazUhNIkFniQu501TuI9sZ6Nx1+2SCHw=;
        b=GTfngjY5Y3Kw0hoAX8Am5z/dOsKAvrVRwf8v/wy6fUrvFaaOsv+F60a1Ifv5hakQVG
         dIPmmxFMOJlsqQfjiF0F6ls3bCW0kwEG/CQy766fQJ5YntFAw9NOO7pQ/A9TbhfbxZBB
         QGlaGpnHAovm1Wr9rpncI2k2PQJDyhdzl22iPBZSHrD6zmQ2DFn21cbyEIZxIXECw3pA
         Gmyw5T0gd3gImM+UclNh7VWLP3+VBlqSuMmlJ1ak0fMiFVrrc7npc5D6opAq9AEGF5LW
         4xEKwIRYBnSlkgv45aWdyXhd2BGpVtQKrJ9K+jLPOqI2vb3KVkGVmitOGi3fjNu8moYb
         h6fA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1X6tRomJEOWUK35MNDZeMkKI1OeJ7Uml3L39UaiwkNCb/gbEh+cerNm/NcwMYBFBBVWu+5A0KkTH/@lists.linux.dev
X-Gm-Message-State: AOJu0Yycj2kS1RnQXjvWEB9FM31qO2mQYzix4Ea9OeP6RZPZ8bJg2307
	w5JLXOHZ9z3+i7x0Hx5+1td9rauZDkIz4JfjjbKAVZlbR0jy2M1nZCa81cTsnRDKVXQb14Y+2t2
	nkBIHMiKWFLQEcMn+xVvNA87DAxjjW4ZN0gKQlQ5n
X-Gm-Gg: AR+sD13jZplxEcuSM0DOVJGQGi7yF1fKR/EE3/tyw2zU3t0IyL45+dsEV9+uZGs1dsk
	E9rKH02YsmOxtMrZMF4ZqAuSboSVCgw3OjjwRckh55uL30MXj5cPLPH3gBtCjFpSeRShY6ClYUX
	k19KkIjpdkBDC2GH3NIMByyqODYNW0eggTCR62LM6PrMVAo8TeU5RCl3B6uhZdE8HEPd7pLR2us
	FzaDzh+XXDxDRn0s0w3T5LlkSYPYFn8N0nmFhT+qKZkPoDSbNDXVVhjCls8jHM1Etq6qDnN2KG3
	X1u2AkwRZqKOPPp+Xqo8NEG8qjhg/JBVq++YQrEIuzv/caT1eH2Jjb3g
X-Received: by 2002:a05:6214:230a:b0:907:c056:d63a with SMTP id
 6a1803df08f44-90a6ffd0170mr15698606d6.20.1786505136817; Tue, 11 Aug 2026
 20:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803134403.80630-1-steven.price@arm.com> <42170467-fe36-4382-867f-49bdc6a7bc9a@arm.com>
 <d0ffbcb5-0cca-4d1e-9788-6b430345fa9b@redhat.com> <5e86232a-89ed-40ff-89e2-9e48fbf9554e@arm.com>
 <e2894206-7470-4606-b9ac-eedc8d2bdaf3@redhat.com>
In-Reply-To: <e2894206-7470-4606-b9ac-eedc8d2bdaf3@redhat.com>
From: Alper Gun <alpergun@google.com>
Date: Tue, 11 Aug 2026 20:25:25 -0700
X-Gm-Features: AUfX_mydHvtdt9zTnMQDxMEfQcPxjhamET6J18JMLKXgxKIfjEME9sN1_LoiXoQ
Message-ID: <CABpDEukGY+ctSi6wHAaC7o4pGmastX_Y18K2_VYDhNME7TF+wQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/45] arm64: Support for Arm CCA in KVM
To: Gavin Shan <gshan@redhat.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 8:08=E2=80=AFPM Gavin Shan <gshan@redhat.com> wrote=
:
> As the following calltrace indicates, -EAGAIN is returned from tf-rmm::up=
date_ripas()
> because true is returned from s2tte_drain_pending() for the S2TTE corresp=
onding to
> IPA 0x80000000. Linux host received error (RMI_ERROR_RTT, level=3D3) in r=
ipas_change().
> Upon this specific error and the IPA range [0x80000000 0x90000000], find_=
map_level()
> returns level of 2, and realm_create_rtt_levels() returns 0 without popul=
ating any
> RTTs. After that, rmi_rtt_set_ripas() is re-executed and the above loop s=
tarts over
> again.
>
>    Linux host
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    kvm_arch_vcpu_ioctl_run                     // cca/host-v16
>      check_vcpu_requests
>        kvm_check_request
>          kvm_rec_handle_request
>            kvm_complete_ripas_change
>              realm_set_ipa_state
>                ripas_change
>                  rmi_rtt_set_ripas
>                    SMC_RMI_RTT_SET_RIPAS
>
>    TF-RMM
>    =3D=3D=3D=3D=3D=3D
>    SMC_RMI_RTT_SET_RIPAS                      // tf-rmm/topics/rmm-v2.0-p=
oc_3
>      smc_rtt_set_ripas
>        s2tt_walk_lock_unlock
>        rtt_set_ripas_range
>          update_ripas
>            s2tte_drain_pending                // true, returns -EAGAIN
>
> The problem is the pending-bit for RTE corresponding IPA address 0x800000=
00 isn't cleared
> when SMC_RMI_RTT_SET_RIPAS is invoked. I didn't figure out how this bit i=
s set and why
> it's not cleared in time.
>

Hi Gavin, Suzuki,

I think I ran into a similar issue on rmm-v2.0-poc_3 last week.
This looks like a potential RMM bug: could bit 32 be part of the physical
Address (if PA >=3D 4 GiB)?

It seems s2tte_drain_pending() in lib/s2tt/src/s2tt.c checks bit 32 without
checking whether the descriptor is valid or invalid.

In my testing, guarding the drain checks with a check for S2TTE_INVALID see=
med
to resolve the boot hang:
--- a/lib/s2tt/src/s2tt.c
+++ b/lib/s2tt/src/s2tt.c
@@ -1701,6 +1701,10 @@ unsigned long
s2tte_clear_drain_pending(unsigned long s2tte)

 bool s2tte_drain_pending(unsigned long s2tte)
 {
+ if ((s2tte & S2TT_DESC_VALID_MASK) !=3D S2TTE_INVALID) {
+ return false;
+ }
+
  return (s2tte & S2TTE_SW_DRAIN_PENDING_BIT) !=3D 0UL;
 }

@@ -1730,11 +1734,19 @@ unsigned long
s2tte_clear_tlbi_pending(unsigned long s2tte)

 bool s2tte_tlbi_pending(unsigned long s2tte)
 {
+ if ((s2tte & S2TT_DESC_VALID_MASK) !=3D S2TTE_INVALID) {
+ return false;
+ }
+
  return (s2tte & S2TTE_SW_TLBI_PENDING_BIT) !=3D 0UL;
 }

 unsigned int s2tte_drain_handle(unsigned long s2tte)
 {
+ if ((s2tte & S2TT_DESC_VALID_MASK) !=3D S2TTE_INVALID) {
+ return 0U;
+ }
+
  return (unsigned int)EXTRACT(S2TTE_SW_HANDLE, s2tte);
 }

Sharing in case it helps.
Thanks,
Alper
