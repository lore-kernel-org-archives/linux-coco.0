Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DF318E75F
	for <linux-coco@lists.linux.dev>; Tue, 20 Aug 2024 13:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724159947; cv=none; b=ZEGQXEBUU2mFrrMGq7FXbCEaq1R1zrbYPUCEQX30DdC9rGDDV8Jv9izjDraNBwJ3QmWXY8gPP3UGp+1eDdPH77FJlF6CVQnMVYnPsjrRcES9DJa1UfL6ky58pJaCK/wwYFXcFB6BroxaRR9sEqVpCxRX7g5MNy32nPcpyc66IqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724159947; c=relaxed/simple;
	bh=jwzNwqi23bxpGTQU9W6ZKRunMeDE8ltL7X3DcNiGD08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1+ytMJHfFTx6iOuoWof8z/fYwaFqCvNrf2F7Wjopni3m87FrIIWTjmWsXer8Cl1XJnthu6R5D+0jwZtOeArwhmAAE3KN1gbrs0tr/ggwRFeeIn0dfzHPCxBZxMloy+moi4R5kaMVgi56WiL1fogu4/FHjUZkZQJV6RSVT0FVvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=L/yxpQh9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="L/yxpQh9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-36d2a601c31so3183400f8f.0
        for <linux-coco@lists.linux.dev>; Tue, 20 Aug 2024 06:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724159944; x=1724764744; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4jr0wUUNxuwMBzuuDz03CQuikwyocGytAf7u+HScwAk=;
        b=L/yxpQh9wTdPQaHwJmAWN2XICHdPxUWPQujdCu+GM0jlYBW44G0rGt6Nbntq0wDCdd
         24KO80TimgEY+9ktnoYYenwEU8yLPkUX1jHTKgYG2RcxB/Af6AkQMaUPhJawjjO4zsJn
         canAwdfEzAmqKDfNZEinwHsWI2um7E870tQ8Jfhx82PoN90i00w7vzvam430ApYmVqOM
         0iCftVl52GZY6072eVMyUXbak76yL2EzASEfHvT0gZ4xaO8YD40PqRfZdEElor2q9Nh4
         d1o26UYJhZM5ue5dV4Yc4EuLM4X+M7HUHRw6GlERaYk9QGLWVhoEJ3FlIRbr795Xwnle
         TC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724159944; x=1724764744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jr0wUUNxuwMBzuuDz03CQuikwyocGytAf7u+HScwAk=;
        b=AsTHIUfXQoe14n7y07bdLObylGPzpUGS2ZPYrx3qNT7uxawrp5Z4gIgn1hi2k+eJQC
         MyHc/2qsb6ARYEBVv0YkvKhsBwOoV3bdQJ4e/EbxZ7aX2J4hYcBIlEgcCCrsWrKQk7wR
         NWBaxkoc7ddPMeFSsgCjEezsBQc7lolgJvq5mpqP5yJSO7H/iRY925UZImR2Rt/qIiez
         gRX3Vxo7XC03WwqMIcANgl5hHueP/R2XpXcuGN2a07ktBT3HwnrwxmcKOrPMKjF/uRUC
         j+s4fSPk9PzK854Me8XkPaDWMRjP4apA7ZOV14uoHs1Nl9I/gE6qrTHoGufnb+8VsMY9
         44ww==
X-Forwarded-Encrypted: i=1; AJvYcCWJ1i2qECo8XKaXUCugWiKTyUqnSH0lwYglKUhFjHMwEcQXly85tfoXcE4XQPdnmBzaUbpRLI4XJ/dHE9ZYmiBJlaSEWxB0PnG+pQ==
X-Gm-Message-State: AOJu0Yy5mRb1lfJ6KYsGNOWuXFoTvxV9OQjBdn/k5jn26cXRV5jBcJxH
	AiNQQTVuCOCIWM3UsdVtgsXYczdOwqnoxSrofBrm7YW1EejUQoBuNOaraG7FwAo=
X-Google-Smtp-Source: AGHT+IHjT9qAO+emW/POSF1qBJZ0ZFLKI59tqUdczr2XqRvddNqHnQb3poFA0SPeVno3u8Z7Ce50uA==
X-Received: by 2002:adf:e552:0:b0:368:7f8c:1b38 with SMTP id ffacd0b85a97d-37194655c7emr7988293f8f.30.1724159943777;
        Tue, 20 Aug 2024 06:19:03 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a0eesm13242280f8f.1.2024.08.20.06.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 06:19:03 -0700 (PDT)
Date: Tue, 20 Aug 2024 15:19:00 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: Qinkun Bao <qinkun@google.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Yao, Jiewen" <jiewen.yao@intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>, biao.lu@intel.com,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vishal Annapurve <vannapurve@google.com>,
	Chong Cai <chongc@google.com>,
	Dan Middleton <dan.middleton@intel.com>,
	Alex Crisan <alex.crisan@intel.com>
Subject: Re: [RFC PATCH v2 0/4] tsm: Runtime measurement registers ABI
Message-ID: <ZsSXxMn-E7OCvxST@vermeer.tail79c99.ts.net>
References: <20240128212532.2754325-1-sameo@rivosinc.com>
 <c17a31e4fb30f5f9d4a337e5bd8d54cc6f99eef7.camel@HansenPartnership.com>
 <6DEAEC08-420C-46A9-8877-EBF60331A931@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6DEAEC08-420C-46A9-8877-EBF60331A931@google.com>

Qinkun,

I am working on a adding a patch that generates and exports a CEL, but
this takes longer than I was hoping for, mostly due to a lack of
bandwidth on my side. I will send a PoC for this as soon as I can, and
folks can improve it from there.

Cheers,
Samuel.

On Mon, Aug 19, 2024 at 02:25:15PM -0700, Qinkun Bao wrote:
> A gentle ping on this email thread. We have tested the patch series [1] and will release a product based on the patch series. 
> 
> If the patch series can not get upstreamed, the whole confidential computing community can not have a way to measure the workload with RTMRs. Without the patch, RTMR3 is completely unused. The patch works perfectly for our usage case (Like the existing TPM ABI, the raw measurement is taken instead of recording the log entry.). Assuming RTMR serves as an alternative to TPM-based measurement, migrating existing software to the RTMR could be greatly simplified by developing an ABI that resembles the TPM.
> 
> I don’t object to having an ABI to take the log entry. For our usage case, we use the Canonical event log [2] to measure the workload. I do think that we should NOT block the patch series for several months to solve an issue that TPM can not solve. 
> 
> Link:
> [1] https://lore.kernel.org/lkml/20240128212532.2754325-1-sameo@rivosinc.com/
> [2] https://trustedcomputinggroup.org/resource/canonical-event-log-format/
