Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03774210E2
	for <linux-coco@lists.linux.dev>; Mon, 22 Jan 2024 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705909655; cv=none; b=PBHtG0zTUPmz6b9jhM+Gjdr9MnXNMg3zlq9KIRm/2Qq3eCgkwBLgplfbzBwzKAeA5zYLzBOCe7QtovvztWoJ+hFmdICXwg7Gdl8JeAEtnnuOpJrL7Qw45nQ/vgcr/foZEjf4mq0PbFpu9Y0szDoS8cAgTHjYmrvQniD6+YAVTe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705909655; c=relaxed/simple;
	bh=7gN0pw0Jx+OaK+oQL8aEN9UCrERUzCUSwTwWQLDx9V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLNZgY/3XBUW2STZrP6D8/MghKUemJ5hF8qHQOAKoOh609eWCrg/XREMLanW8vawkHnvVWzyE0C+Kzn+cXKih5FKTD4C7Yj/y9vE3y/wKfYuS2Y0pPQakbU1/fAzWxwcvhc8FghR3MREdd8pb336TS+zuLiJej+nnkE6pR/SL3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=cqSBJCPC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cqSBJCPC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40ea5653f6bso21030745e9.3
        for <linux-coco@lists.linux.dev>; Sun, 21 Jan 2024 23:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705909651; x=1706514451; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ySmY5MAyDMutjoMPe3tReX9rWPyvSoGQC0n/7ejYOPA=;
        b=cqSBJCPCrUNl1XQH1n5p0KPfhLiwhYEMElxsbU4w9ykY8apMRViiT8BU7PHSna0rxj
         MocXAuIu/38lSWFgKVx0DVDbHffABfnO3njoieZMY+rQEiuQZg29a3djpE3juklHgBbg
         lOFbR+ELPh62vxSwb2mxZBvcIMvroaxDizAOMiviFWEzZT2xGed+zLRozMV8+KjqmjJN
         lehWRPrnpzRTlGSojqKdUwqiVfCzZiaMEqijNbAo/x/IPJsGWkEFcdc9C24FwmkeO0RX
         WE2BCaqzZUIMFZZmsSyqM2IOcYM3Sc17A3ldKl+5ayy3hVp1dbH9R7+U2+XyQ9t7H4CG
         /dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705909651; x=1706514451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySmY5MAyDMutjoMPe3tReX9rWPyvSoGQC0n/7ejYOPA=;
        b=ROrxyCma/CMtdmjK3fuwUDm323A3Uplr1WvpFxjy5bNlwyf5dVNdNCJpg428cDkE2C
         0pUQLlgXjF/+pRBT7aCqSfHbei/7JVRphtwrgBqYE1UWiQaOhU+1hC2YdHuLl8n7wkMd
         3OpXHunEi5RLgxCJibPeFaF79dAReQfu2ennu4iuHYQMvsjQKtDh6h2UidcmyJos6cEW
         8uD/d5tqecxyFSTl7zJaSzXKnQlCnl3R78rbCBH9P052iyxKCN1+rshn0ZzbP5ULJuhp
         +46DQdVStxEWUOcNBO8O1DqpTfgpPPQwwHsVq1EF8sUDoXDsz+GJOfKexKG3aQXDQ+Fw
         HlPg==
X-Gm-Message-State: AOJu0YyX0wITSZyLmI2zQ0AhV2BHLKoVPkO0+ojZAx6njNQcoO4YBvsL
	X6Bb+T2Ri8MDK5I1wMvlnMWrp/8fndCgs+VX3r09eeIwJ7hL/neo4sNis3Ih9hS9mqsccEKd7cG
	Q
X-Google-Smtp-Source: AGHT+IFITIosAYOqlxn8hFlNeDM7+hCXETt1OYV89AUkMK0voRgz3wA/biGanBNOuCF5HAzJzCZvpA==
X-Received: by 2002:a05:600c:46c7:b0:40e:71e3:139d with SMTP id q7-20020a05600c46c700b0040e71e3139dmr2282194wmo.154.1705909651024;
        Sun, 21 Jan 2024 23:47:31 -0800 (PST)
Received: from vermeer (lfbn-mon-1-1176-165.w90-113.abo.wanadoo.fr. [90.113.119.165])
        by smtp.gmail.com with ESMTPSA id r8-20020adfe688000000b00337d97338b0sm8811352wrm.76.2024.01.21.23.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 23:47:30 -0800 (PST)
Date: Mon, 22 Jan 2024 08:46:58 +0100
From: Samuel Ortiz <sameo@rivosinc.com>
To: Qinkun Bao <qinkun@google.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, jiewen.yao@intel.com,
	ken.lu@intel.com
Subject: Re: [RFC PATCH v1 3/4] tsm: Allow for mapping RTMRs to TCG TPM PCRs
Message-ID: <Za4dcowdY84fGF1f@vermeer>
References: <20240114223532.290550-1-sameo@rivosinc.com>
 <20240114223532.290550-4-sameo@rivosinc.com>
 <1bbf8d3e-aa94-48c7-a1e4-76f9eefc4af7@linux.intel.com>
 <65a72c305291f_3b8e29484@dwillia2-xfh.jf.intel.com.notmuch>
 <5539c533-37b2-4b12-a5c5-056881cf8e3c@linux.intel.com>
 <Za1G9I+tYuIL9ser@vermeer>
 <90EDEF2B-DB43-413F-840E-3268977FDBD0@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90EDEF2B-DB43-413F-840E-3268977FDBD0@google.com>

On Sun, Jan 21, 2024 at 06:09:19PM -0800, Qinkun Bao wrote:
> 
> 
> > On Jan 21, 2024, at 8:31 AM, Samuel Ortiz <sameo@rivosinc.com> wrote:
> > 
> > On Tue, Jan 16, 2024 at 07:35:30PM -0800, Kuppuswamy Sathyanarayanan wrote:
> >> 
> >> On 1/16/24 5:24 PM, Dan Williams wrote:
> >>> Kuppuswamy Sathyanarayanan wrote:
> >>>> On 1/14/24 2:35 PM, Samuel Ortiz wrote:
> >>>>> Many user space and internal kernel subsystems (e.g. the Linux IMA)
> >>>>> expect a Root of Trust for Storage (RTS) that allows for extending
> >>>>> and reading measurement registers that are compatible with the TCG TPM
> >>>>> PCRs layout, e.g. a TPM. In order to allow those components to
> >>>>> alternatively use a platform TSM as their RTS, a TVM could map the
> >>>>> available RTMRs to one or more TCG TPM PCRs. Once configured, those PCR
> >>>>> to RTMR mappings give the kernel TSM layer all the necessary information
> >>>>> to be a RTS for e.g. the Linux IMA or any other components that expects
> >>>>> a TCG compliant TPM PCRs layout.
> >>>>> 
> >>>>> TPM PCR mappings are configured through configfs:
> >>>>> 
> >>>>> // Create and configure 2 RTMRs
> >>>>> mkdir /sys/kernel/config/tsm/rtmrs/rtmr0
> >>>>> mkdir /sys/kernel/config/tsm/rtmrs/rtmr1
> >>>>> echo 0 > /sys/kernel/config/tsm/rtmrs/rtmr0/index
> >>>>> echo 1 > /sys/kernel/config/tsm/rtmrs/rtmr1/index
> >>>>> 
> >>>>> // Map RTMR 0 to PCRs 4, 5, 6, 7 and 8
> >>>>> echo 4-8 > /sys/kernel/config/tsm/rtmrs/rtmr0/tcg_map
> >>>>> 
> >>>>> // Map RTMR 1 to PCRs 16, 17 and 18
> >>>>> echo 16-18 > /sys/kernel/config/tsm/rtmrs/rtmr1/tcg_map
> >>>> Any information on how this mapping will be used by TPM or IMA ?
> >>>> 
> >>>> RTMR to PCR mapping is fixed by design, right? If yes, why allow
> >>>> user to configure it. We can let vendor drivers to configure it, right?
> >>> I assume the "vendor driver", that publishes the RTMR to the tsm-core,
> >>> has no idea whether they will be used for PCR emulation, or not. The TPM
> >>> proxy layer sitting on top of this would know the mapping of which RTMRs
> >>> are recording a transcript of which PCR extend events.
> >> 
> >> My thinking is, since this mapping is ARCH-specific information
> >> and fixed by design, it makes more sense to hide this detail in the
> >> vendor driver than letting userspace configure it. If we allow users to
> >> configure it, there is a chance for incorrect mapping.
> > 
> > I think I agree with the fact that letting users configure that mapping
> > may be error prone. But I'm not sure this is an architecture specific
> > mapping, but rather a platform specific one. I'd expect the guest firmware
> > to provide it through e.g. the MapPcrToMrIndex EFI CC protocol.
> > 
> > So I agree I should remove the user interface for setting that mapping,
> > and pass it from the provider capabilities instead. It is then up to the
> > provider to choose how it'd build that information (hard coded, from
> > EFI, etc).
> 
> The UEFI specification has defined the mapping relationship between the 
> TDX RTMR and TPM PCRs (See https://uefi.org/specs/UEFI/2.10/38_Confidential_Computing.html#intel-trust-domain-extension). The current RTMR implementation in the boot loader 
> is “hooked” in the implementation for the TPM. 
> 
> When the bootloader needs to extend the PCR value, it calls 
> `map_pcr_to_mr_index`  to retrieve the corresponding RTMR index and 
> then extends the RTMR. Considering this behavior, I don’t think we should
>  allow users to configure the mappings between the PCR and RTMR. (See https://github.com/rhboot/shim/pull/485/files <https://github.com/rhboot/shim/pull/485/files>).

Just to be clear: I agree with that and I am going to send a v2 with
that user interface removed.
However I believe that we still need the TSM framework to know about
these mappings and the question is where does the kernel get it from?

You're suggesting that for TDX these mappings are architecturally
defined, as described by the UEFI spec. For other architectures (CCA,
CoVE) they are not (yet), so I'm suggesting to leave each TSM provider
backend decide how the PCR to RTMR mapping should be built/fetched and
provide it to the TSM framework through the tsm_capabilities structure
that this patchset introduces. The TDX implementation could decide to
hardcode it to the UEFI specification.

Cheers,
Samuel.
