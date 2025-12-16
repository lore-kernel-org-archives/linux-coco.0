Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BFE1E0E14
	for <linux-coco@lists.linux.dev>; Tue, 16 Dec 2025 00:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765844121; cv=pass; b=eXYlpgQ0bCNIMmFJCZv9Sc67JWGxMga8FAb0fEm4UC+td0+vj6IBXavEer8/kSONFj9INttOpt+egGXtPiX6FdVn6QoNcJYsfZQ3QQq0TOtwyGTJRMSlgh0jK7zwOu9pdXVIndHxDBPz1b7nvmiDYknm7QgvlTSsnvslYUVvEck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765844121; c=relaxed/simple;
	bh=fn0GwhoNH8+ZzMJCJ3+pwW254YPaPG3Wl453zVROsYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQNoT1cAxuULn0qp0whOamlJO9x5kcXyH08U8ozntmcCk+5AnoMIOz2Zfo3FgC7++NBqsVSJUwK/S4oDJEDsu9qlX5RPwYWeLrNjXNTXBxyyNM/IWsnZJmv+hZkntOxtSWgQnjf7cOZru9ncmO0F1oDF+txMZ4ZKFPBv/KSRsO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AoUanp4R; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AoUanp4R"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29e0753e5d8so12795ad.1
        for <linux-coco@lists.linux.dev>; Mon, 15 Dec 2025 16:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765844120; cv=none;
        d=google.com; s=arc-20240605;
        b=ESPpKqgoTOrbpd7/BUtKFycvB3jfkJ3qGxA2x16I0eCXf0QAUyp03nX6N9QEHGPJXV
         ZXVdpnrLOPkHDKeCainNuyc7um0OYO14SEdaIbdbD/qZrL6VjymmAIXgAz3fsI9rO/zM
         5CnnI4ImlQaPlRuWawx3aFe29tGinYHH3+Vbap3QvFoj6s1mO65msyVFCNsDlndETObx
         WyvSgYXmAYL0rcTEoGq06gJpq9C3dOt6k9bcjH/IoiDg4LnHUOGlc+vms5AhKLE1inqv
         BIXpGhtLACSY6i0acSJ6tQvUdsJjYZ9cxMJS4jJWYgAJkKU92otYIleHdd/NSzHOQ8My
         JfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fn0GwhoNH8+ZzMJCJ3+pwW254YPaPG3Wl453zVROsYE=;
        fh=ZRvq1ICSgFw2Taj+L0hKPNAhnh+GkuEjQ0VXTXDYpZA=;
        b=E79+g7N9OTTJUYCHxSlVGyEC1UMx3wmn4K2Z6s4i6UmNyslaB6Bo07XdotlOpt450X
         nIeixW2Qny+FQNsu1wW7meiAlVT/S7NdIuKaQ+d2yhj/sbcLFdAv50gWfitwjB7cDznb
         KBCI8WVjY9qgifkzBUjjFrr1q2Pj2jiR4jOUfBFX7BqWx1YuNWrC0j5+Me+Cgxln2PFv
         jTAbUBIb+DiwSaonMSxtQzD1z7wG4NnvOZOnGce2vWCSVFvSWOgJglCRhir2B/ho5vNx
         fZy5IAMDis0csE4yhWyqW/XBDzTK0Rr552ffpMvBeGyOVhP8XgCkLtxWuP8cA8b3zBtB
         7o8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765844120; x=1766448920; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fn0GwhoNH8+ZzMJCJ3+pwW254YPaPG3Wl453zVROsYE=;
        b=AoUanp4R3+7C120M3vcFW60GbksxMHXBhSHN4CPBgIhTQb+xuY2n2A4NzLjQXyV0Vq
         VvRQrRh7bu/O2SEuuBaIW/ISR3IUfc0I6BOL+ada/07+wmm4VytapUR0RBTrTdxJ4D67
         U3vJKUqAoSPrm3VyvVOaV+p4CTsRP/MUCOhqvUQPge2KWdoC7zQLOob2h/kv852qVtFG
         SftdPzPmImFmWQWUQDIiXAjTwL9GHn0K6JzRR9HSkIOuj6vQNAZQ0s822TLEHJzoE9mQ
         dkESdxvRhN6YZMQQiRSWCzcQVdM0eAme3qtoGW6GZ1n4lYSc5jwlr/MKNGAx35i7x1ve
         tRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765844120; x=1766448920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fn0GwhoNH8+ZzMJCJ3+pwW254YPaPG3Wl453zVROsYE=;
        b=RGOP/cZh8QKgxhfwHmUG8R9utClE0w40IX8MGxhfbvkge8jzhydMdEUI5UDfc+e/Y3
         zgzKN9VB1KbukF7bfunXOy4I1yCEfknUklLtvW8DjJcGc7W6gHiME2U//DPbRaoNeHLL
         7YhezD9vEW8NuMaRSuyMDJX3BEDI/wvwe/hP4CpYSA9/SglI6FHlXbU5N4K+Rl8aYE3m
         E2N4NAoX13dH2wUXm7jkU0NiYmablo3m0gEP0V33pwG9pp68tvXprya9ktItOorBN7ep
         EwdtNML2Avuozznu7ptS9+Zufaj2lYl/cTXpwCwJ/jKW9cQv8qUJ/5Qnx4d3MNLA7Xil
         NERA==
X-Forwarded-Encrypted: i=1; AJvYcCVKsU93MBFOZET5JoaCWmD6wRD+fPMTIBHsvBaGj82IXVj49WUlzcxt81Xo6TnOkLqlS8SSUGPRvDez@lists.linux.dev
X-Gm-Message-State: AOJu0YztrJSuDS8Vs8CZC1CtgMh2CQODSVreh23kv9yepz0ESDsMUSv7
	gJsH7EyLTlTWEJdPT0/UeZZMEx0REAPhce/z1C96JmCtUiZ8m+nbWDJrvxmOdZdBiN/Np+bcn3N
	Qkw6shAp0GL1ZQBzWfOZBdQUd8EPCY6WltJF9Cx1A
X-Gm-Gg: AY/fxX7ELCxYIBp12HhxNFUMgFPnLQJY0zau1o+f5Sc9kLjBxaejIbwietoHOoZovHk
	Eny0oeKsM54NBU/He4ZIoIV2Y9fk91H5rofQ8EjUs1tsxnK/YC/vazxVPqgSMjSADfEz6KBEukx
	mn2xc+NAulTH2S7ee+Dn0NdjUoPmnv7RHjzSszk04/CfYAFC8NBrbaTUjfEVlfMQ1Ep2L+bs7oY
	Xct3r6IRCyqO+E8kpn3GIWL1ykXfkMC2fDbMTdVhyYPhctmPjmzye1CslXJFqyentEnmn48liF9
	QiyM9y2MuRtf8PUikYnriI/xqIWhmPC0THjqkyU=
X-Google-Smtp-Source: AGHT+IFTOP4Gaoei4VRS4FRMsmoH0dQfq8ttEHezcqkwMWBciDm3nDzocBxJhP2cIEsjUvXgKDFs3tmzZw+Z/7G1Pn0=
X-Received: by 2002:a05:7022:3a8c:b0:120:5719:1854 with SMTP id
 a92af1059eb24-12057191931mr3515c88.18.1765844119264; Mon, 15 Dec 2025
 16:15:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215153411.3613928-1-michael.roth@amd.com> <20251215153411.3613928-4-michael.roth@amd.com>
In-Reply-To: <20251215153411.3613928-4-michael.roth@amd.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 15 Dec 2025 16:15:06 -0800
X-Gm-Features: AQt7F2qPIdqB4YBCefT1YU3kuQHJVylNF8CoP-Km5GjS1ybCK24n-Ma9vuvP0QQ
Message-ID: <CAGtprH-_8gKzLGkU8HN=D54DDffk+mCj_7ymyexN1aDSS31fHA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] KVM: SEV: Document/enforce page-alignment for KVM_SEV_SNP_LAUNCH_UPDATE
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, pbonzini@redhat.com, 
	seanjc@google.com, vbabka@suse.cz, ashish.kalra@amd.com, 
	liam.merwick@oracle.com, david@redhat.com, ackerleytng@google.com, 
	aik@amd.com, ira.weiny@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 7:35=E2=80=AFAM Michael Roth <michael.roth@amd.com>=
 wrote:
>
> In the past, KVM_SEV_SNP_LAUNCH_UPDATE accepted a non-page-aligned
> 'uaddr' parameter to copy data from, but continuing to support this with
> new functionality like in-place conversion and hugepages in the pipeline
> has proven to be more trouble than it is worth, since there are no known
> users that have been identified who use a non-page-aligned 'uaddr'
> parameter.
>
> Rather than locking guest_memfd into continuing to support this, go
> ahead and document page-alignment as a requirement and begin enforcing
> this in the handling function.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>

Reviewed-By: Vishal Annapurve <vannapurve@google.com>
