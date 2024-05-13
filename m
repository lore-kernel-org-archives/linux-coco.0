Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3BE50289
	for <linux-coco@lists.linux.dev>; Mon, 13 May 2024 05:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715577051; cv=none; b=VpLOAeF48cv4iLr2BP4vd9PJW35qZSCSGg/tnFyh1ENQh/2jZ24Cds8kO/Xpp6POvChRfxw1v0c5qm1asxdNJUKFMJ7wmzF3Uyv2tzMlykSheLDnfOD3z/S/wdjfg4MwPO9EXpvlieh/o1YxamQAXlkhWbDkvHCJiXe1Y9SFZDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715577051; c=relaxed/simple;
	bh=HBHs6Jdq5L4payjEaLxkfYZqRl4a3T3+ZWCXssW+ylM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/Ssc2xihiOvlpQEgXqMUkxkRnH7LveXYNrSScStOvYfoUljgND8M6WFFAm3RiLsBNecX3MHEyq3MZSn1S8pcHU+miIQ24+4RN4BZGRChJRlEQFVJGOcDo5b5wsnWQxtkXkTSUXPfHmQmVx0coJ+sPpZskgzlsE24Abn+Q74SJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Sm2dz5dT; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Sm2dz5dT"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e3e18c240fso40714891fa.0
        for <linux-coco@lists.linux.dev>; Sun, 12 May 2024 22:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715577047; x=1716181847; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HjwIhx6GXTcBVrSGYXTICyCbVaFi7BXL5RZPD3GEmuI=;
        b=Sm2dz5dT3igwrXR/HEA5rFeTwgRc540A+EQoWzFEJ+3VE/pnsK/xI6tuygpn9x5J0J
         r2ej+suKvwGDWJ/DU0yR5fTsT/q5EoxKQyhIr6VYbxv3ylZIZcKgWz0IdD97tlEXQqEl
         n02rs7sdODxlKBUgU9VhITEmHxJaNxVKR+bKQbMRGYjCMMYA67yc1BoiV/wDbtX9WJXs
         2VcU5vQKK4Ya1FOskgYndkVcBvffiQIEa/VgEDolvdMewUT62MZPPawDqI/cBotJJvFu
         551sC4ZcAeKPngQ0UcZkF5372VV0QWHma+hc+IogwjAMimy/vDgNQHoR1QZEHaNVwhqy
         zXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715577047; x=1716181847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjwIhx6GXTcBVrSGYXTICyCbVaFi7BXL5RZPD3GEmuI=;
        b=dHqWAASuHMiioKZokaA5/7qM6jXJagDIbyDkkVaqHK0rJN/9U/BLn9z8jQCzldC6fd
         1HwjnJ9shyLzdxPbA0IBlP5lvmNLJDTJPBMXsDbt5TiQrqOevSnXA27mDr2dCA0kMtjk
         1blByKbetVVZuCnaL4cR93vhBrwnAUoMrU/OR9TVXEU96dDz7Tc7PuuKuCMsq9IEq9H0
         RqNIKRMnjJazmoZ+l6sOuX9CSCvqAMnCsEnaU6Ac0A6ANHHLasliMZrl20aSci0CBHGT
         Ew/pT4fE1syzH5tVtHAdmmdnRbsvwOiZRmoRK2kP4Kk2zLKIyR5J1ZHx4HZ9SuDpsVFh
         a99Q==
X-Gm-Message-State: AOJu0YwXC4qd3++UIHlGiKHolNaD22nSonrPTiwo2RWllxjYphp7HOnY
	JesKMVxhQp13CrBrYo4ZO58IxsGM2ke0N1XzyoK1bbp2vX2QbRstm3HuU1tn5LZCiQqQeyfnU1l
	W
X-Google-Smtp-Source: AGHT+IEZZo1lUDnyQW4UpR8RQMT9ubx09ggwRTCmzz00O+w0nru9z1pZeP3PsIlxiXWfRE4JcQi9Wg==
X-Received: by 2002:a2e:7004:0:b0:2e1:f05f:6424 with SMTP id 38308e7fff4ca-2e51fe530bemr76627001fa.15.1715577046535;
        Sun, 12 May 2024 22:10:46 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce25casm144480115e9.20.2024.05.12.22.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 22:10:45 -0700 (PDT)
Date: Mon, 13 May 2024 07:10:44 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: Dan Middleton <dan.middleton@linux.intel.com>
Cc: linux-coco@lists.linux.dev
Subject: Re: Confidential Computing call May 10: RTMR ABI & TEE I/O
Message-ID: <ZkGg1EV3KxdaUoS7@vermeer>
References: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>

On Fri, May 03, 2024 at 02:55:20PM -0500, Dan Middleton wrote:
> Hi
> Next Friday, May 10th at 9am PDT, we have a Confidential Computing
> devsec / BoF / Discussion Group / SIG call. Everyone is welcome.
> 
> Tentative agenda includes RTMR ABI v3 direction and TEE I/O next steps.

Thanks all for the discussions. The slides that were presented for the
RTMR ABI v3 are here:
https://docs.google.com/presentation/d/1qMk-8TiMigVmVAEDWXqPu9Jd7OJ8AGvCR34Lp2WunhU/edit?usp=sharing

Cheers,
Samuel.
