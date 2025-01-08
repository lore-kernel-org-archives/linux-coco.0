Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C4920468D
	for <linux-coco@lists.linux.dev>; Wed,  8 Jan 2025 20:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736369014; cv=none; b=CVGmG+rc9mvleIvEjI+XXz4h46PHVC2/wXfFxoyd+cr6ASbGTj5rJgSneIqdR29QT6an2OfNVx/n0s6opW/6KDHYShvOKvJ5FrgbjuEoG9f5sw7fp4Pc0tTRgLMYz3Oy5SP/tG5z3zLiBpe2uwIHKmP4FJESa6FxoefpRMEmFEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736369014; c=relaxed/simple;
	bh=qm8/CpXRhDiG6HZFuWxAWdER1SEARMMgNPHW2CIWaBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlL5zwY7Zl07H7o5+vAYhVue0GPdnrLlPYb4JbcH9AXsomqXjA+ZojAfjht+oyCCJM7ogqyA0/H2rW8wT90HtkykjFHtWKfXkwOk8c3hu5WaxjeRh/vedJ+KIw4o8XcVSIBs/gMHLc+F7TE8vS1Kmjjb0YMCQGZNH3mY5l4Nx8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YVRL5xvj; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YVRL5xvj"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so46033966b.2
        for <linux-coco@lists.linux.dev>; Wed, 08 Jan 2025 12:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736369011; x=1736973811; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm8/CpXRhDiG6HZFuWxAWdER1SEARMMgNPHW2CIWaBQ=;
        b=YVRL5xvjFk0K7bhVB9rVqJW9axBRcmB0DX816oqWge+Vp5afL8GRBK8eZFqSBKw0mJ
         hvfI8n0y3cqIbGgMqwwRPDMcteJhLjXOSFdLyIGF/x6N6YZH67V2EcPxBPshGBbIcZ5i
         akA9JsNjk7BgQZzDP0/Av79LKI51gifoTlOmHgvj04YgtfgoNwMc+iJ1+pj80jsL7P3T
         TP59h1W+GlW+4CENofNoJy18xzl9AQ9wYDOCRWLM8AKRsufq7LaqIsTo5b6ygyRcUvP0
         WV6+8EDtfpga+Y5XgVr3AfM9VgVobgEQs8g1MPmsq5IryXOokg0vxH4XnmdmnlfiiEMG
         kNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736369011; x=1736973811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qm8/CpXRhDiG6HZFuWxAWdER1SEARMMgNPHW2CIWaBQ=;
        b=aJYECdIdlMRZXJfxIMbicK/CLq44HDxBMpV4517H1A8lS6UN1lH4CcUBL1MlUukaV1
         1I3Ae0bhv1z+GvaT0xFLfT32+SOH1sH9uIRWD8R2EPK4OBKv4xe5ROBRwwpgWR+Qy8OW
         HpwyoGrSQGCkxUCRBpbAF9e/td/WEFA5v9UlXA45we8gszEQxGdZ2g3VjXGKakiyitdY
         tDsEVwS6892hAamu2/Qp3MABk0kHRgTl8FU0BUWfymnaVA/sf0DDjgVeCcug5Fj13lv5
         9SAMpgB1TGtZxzdwlrP9k+5u+pk6JDSiqWPSDXbuJ/Fwqvmofxw9Pv/0r+7tzh6v9Ajp
         ZlXw==
X-Forwarded-Encrypted: i=1; AJvYcCXn9yIVA/mz35TR7L54L/ZWuFvkMn4NLALDshPJ++VtLRtVmYXdwZmXXw+nfLb391OZcEECQV8wW/3O@lists.linux.dev
X-Gm-Message-State: AOJu0YxGZqKgJJryGfZX20Uev5nlP/9hx33sZL19HHLtL3aFxn/Gbg6h
	pzKMEIP9VtdpsZnV/eLkfAas+gqaZEJdSdO3NuyDsGeFds0yIuzLV7HjIDmTKhW+xTbsqBbQHFT
	3mYf+Lfegdgr6ZKhEmXEl+4qhWITE8XyN9+Kq
X-Gm-Gg: ASbGncviAGhebspMqcvIR4+KMyNfplfyemozuGVPmPGQ56Vv5p/EvRHq3YHg7brCaXC
	+Nig1UfdKmKuf+iDV6DQ4BnzBnyDPopkP/r0Iog==
X-Google-Smtp-Source: AGHT+IEgXNk03H0jABY9SNm5a/PKA1joLYa9MDRlPclWFEDo9UAEYFAiH8VAW/h/fz5g9qovHGnAzdnkeP/Q+WeAIRU=
X-Received: by 2002:a17:906:dc8d:b0:aaf:4008:5e2c with SMTP id
 a640c23a62f3a-ab2ab66fea4mr336788966b.2.1736369010944; Wed, 08 Jan 2025
 12:43:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241218152226.1113411-1-michael.roth@amd.com> <20241218152226.1113411-2-michael.roth@amd.com>
In-Reply-To: <20241218152226.1113411-2-michael.roth@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 8 Jan 2025 12:43:19 -0800
X-Gm-Features: AbW1kvbr7bbe_F2G-RXlZqhPDpFu5CzdRMz-FR5uA8gPAVNRMbKsDEBExbUIkyg
Message-ID: <CAAH4kHZnZn0xkhtuAutoPfbF+52LS1ovY1CSNf10+PWfemL6NQ@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: Introduce KVM_EXIT_SNP_REQ_CERTS for SNP certificate-fetching
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, seanjc@google.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, ashish.kalra@amd.com, 
	liam.merwick@oracle.com, pankaj.gupta@amd.com, huibo.wang@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 7:23=E2=80=AFAM Michael Roth <michael.roth@amd.com>=
 wrote:
>
> For SEV-SNP, the host can optionally provide a certificate table to the
> guest when it issues an attestation request to firmware (see GHCB 2.0
> specification regarding "SNP Extended Guest Requests"). This certificate
> table can then be used to verify the endorsement key used by firmware to
> sign the attestation report.
>
> While it is possible for guests to obtain the certificates through other
> means, handling it via the host provides more flexibility in being able
> to keep the certificate data in sync with the endorsement key throughout
> host-side operations that might resulting in the endorsement key
> changing.
>
> In the case of KVM, userspace will be responsible for fetching the
> certificate table and keeping it in sync with any modifications to the
> endorsement key by other userspace management tools. Define a new
> KVM_EXIT_SNP_REQ_CERTS event where userspace is provided with the GPA of
> the buffer the guest has provided as part of the attestation request so
> that userspace can write the certificate data into it while relying on
> filesystem-based locking to keep the certificates up-to-date relative to
> the endorsement keys installed/utilized by firmware at the time the
> certificates are fetched.
>
> Also introduce a KVM_CAP_EXIT_SNP_REQ_CERTS capability to enable/disable
> the exit for cases where userspace does not support
> certificate-fetching, in which case KVM will fall back to returning an
> empty certificate table if the guest provides a buffer for it.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
Tested-by: Dionna Glaze <dionnaglaze@google.com>

Thanks for your patience.

--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
