Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5FFBFA
	for <linux-coco@lists.linux.dev>; Sun, 21 Jan 2024 18:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705860737; cv=none; b=n+FwalS9h38fR328SGAu29QwcjzwgJtoFYqovOQ515zqN7fp43N5rr3padUs3oRV/NC9chs7OH26+8aoDgjXsu5e7WgKnqnWMpbk1tCNwTCa7ZWDpk1d+hbG2TveiHxBNH9AUU6S9HohHrWL3rKcK6fUzlA7JoGFvjmMcBM4iVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705860737; c=relaxed/simple;
	bh=V7R3RSzDKGYhZPWJ9ig/EoHQy8yLiErGelH8RUO8qDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0yeSAk1zt+VEy8B6iW1s9UQ/cBzLj8R+pIm3UInHaHdxLvK9Xz+kC+7EKmm/TiaWNAd9G6JyazKakAajRqJKOh9CdiwCzDEBxbC5OwhROaQIXr91gHFBrQu1vVjJaSQjwOU9pYFv3Q2BJ1FXq6Yo/e9J73SQsn2is2d/7NjF+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FbFLOzc1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FbFLOzc1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-337d90030bfso2206653f8f.2
        for <linux-coco@lists.linux.dev>; Sun, 21 Jan 2024 10:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705860734; x=1706465534; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1nnKbsnxsY20xhVcSmfYZXg9QGG5JwLaHd8BDjP1Kj0=;
        b=FbFLOzc1V9SIeQ5x0ceauV9zkkiMI9gOYRHDyZVcUsIuTxRkwiD5E1lmU0/ITsZLHO
         HhIK09CZmTlsb2D7Gd7vMfCYzBhgkbTBFM6ZdV/f5PYNz03uWa3cOmFzyyQV1XXrzwbt
         dhYbV0S38NyL8ESfkTucRLALjqYMumqc0936WcFnuGL7kPxoxsoINHO8q5YwGALII4H9
         CH2m73XIDo4xi1KLkdftiquP2XauRnSTKCRT1h0vYc+V5RYy2VaDB+PhM1vmwS1FvFWq
         Vh3MWp8mJ+dA6kmB25Q1IXLHeEcbE6KUnip941Ofdc7pOHAiljA9vQXmXtgK271fc5Th
         uNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705860734; x=1706465534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nnKbsnxsY20xhVcSmfYZXg9QGG5JwLaHd8BDjP1Kj0=;
        b=nlwP+lESq1lQ1eMojsgQW/A59ZhvMilFDJBd0lDvg/KnquW7B1ySovZkXBCeMFoT0N
         A43qsww87WsKScSqq47VTdZwtQFJW2b0KbaHq1YCvGPBOYbG4RsHWYhGRbevUBd+QOd8
         dvmubRPSGkBq7+M8wl1TqlyDFvA1dXr5k6EwsXQNXfWLuNKYve7JdFT3AnLDRCVWs96b
         ZzPHeOaDrs8rTiL+ilxa+ONxK9zWzNTDTepalWeKqdfeEax9hkmakK6FjGNsGYHX2z2a
         8qMd1JpcDCYytQJrptp9FAuCNCiDNt5/trga4ULD4o+CKtBMz3aC/Kqgb3T71VCUTJMW
         DOew==
X-Gm-Message-State: AOJu0YwBrCdefH5vG1zx5c0ev4RChhi9qM5ImAXmTa8RwTtQ549ceH0r
	+Kf+9x75ZkkP+ri0oUmooKBungKWKD0Aqb3Icl4m3YFu6OhyS/dmY0qcEVm53Ok=
X-Google-Smtp-Source: AGHT+IF92bsrQZmY+tgRhf/55ibpl1QJYlh90dPWVCp/zoRaTrolG6ya4uDyNKOjRIZUQeKumr2iIA==
X-Received: by 2002:adf:f84c:0:b0:337:c2ca:c9fb with SMTP id d12-20020adff84c000000b00337c2cac9fbmr947446wrq.93.1705860733685;
        Sun, 21 Jan 2024 10:12:13 -0800 (PST)
Received: from vermeer (lfbn-mon-1-1176-165.w90-113.abo.wanadoo.fr. [90.113.119.165])
        by smtp.gmail.com with ESMTPSA id h8-20020adfa4c8000000b00337d67a85c1sm8560925wrb.62.2024.01.21.10.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 10:12:13 -0800 (PST)
Date: Sun, 21 Jan 2024 19:11:41 +0100
From: Samuel Ortiz <sameo@rivosinc.com>
To: biao.lu@intel.com
Cc: dan.j.williams@intel.com, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/4] tsm: Runtime measurement registers ABI
Message-ID: <Za1eXWiKPQp//1CO@vermeer>
References: <20240114223532.290550-1-sameo@rivosinc.com>
 <20240118033515.2293149-1-biao.lu@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118033515.2293149-1-biao.lu@intel.com>

On Thu, Jan 18, 2024 at 11:35:15AM +0800, biao.lu@intel.com wrote:
> Samuel Ortiz wrote:
> > Some confidential computing architectures (Intel TDX, ARM CCA, RISC-V
> > CoVE) provide their guests with a set of measurements registers that can
> > be extended at runtime, i.e. after the initial, host-initiated
> > measurements of the TVM are finalized. Those runtime measurement
> > registers (RTMR) are isolated from the host accessible ones but TSMs
> > include them in their signed attestation reports.
> >
> > All architectures supporting RTMRs expose a similar interface to their
> > TVMs: An extension command/call that takes a measurement value and an
> > RTMR index to extend it with, and a readback command for reading an RTMR
> > value back (taking an RTMR index as an argument as well). This patch series
> > builds an architecture agnostic, configfs-based ABI for userspace to extend
> > and read RTMR values back. It extends the current TSM ops structure and
> > each confidential computing architecture can implement this extension to
> > provide RTMR support.
> 
> Hi, Samuel
> The ABI does not include eventlog, but eventlog is usually used with RTMR.
> What do you think about how to implement eventlog?

Since the event log is typically maintained in the firmware and not in
the TSM itself, I don't think we should expose e.g. an event log
extension ABI through the config-tsm one.
We could decide to check for an EFI CC protocol availability and extend
the event log when any RTMR gets extended, and that would be an
internal, not userspace visible operation. I'm not sure that this
would scale well with e.g. IMA (a lot more events than pre-OS boot
afaik).

Cheers,
Samuel.
