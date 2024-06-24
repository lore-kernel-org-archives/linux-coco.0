Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFD93B1A2
	for <linux-coco@lists.linux.dev>; Mon, 24 Jun 2024 07:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719212868; cv=none; b=fknj2RGrVJZxn6MSNwaMO2OUncDCUFYvEUlTfrfLA7LRe3V+VAJQBvhZ5R8eGvQeukDqrRduulqOAchmKclL8jdDD3pFBbg0ce9SYYwiwtOSdzv4efY8mJVAlISEquVU59RXdzH/bI9N3Ms3c3UGGlgQA4nKku8eGuO4o74kvz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719212868; c=relaxed/simple;
	bh=DIc2Ek2oqgATcYNtSqSUaLVDknlvsWuPQFBBIIrTz6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6NM1w9lhaWWt60FgXzV8ElQ9O2P4OuIMiaDJ8y+WctsA3Fu+mkW5hAJSaoscf+2Daki3i3lUNxynn/RUnTJpqUXWgpWuohBYKYVQZOQjEmDFcfPfbQnV0BeInOcthWr6vQ/ojC9SuVvIsGGD//mXKctXZohLG/YZ8CFhfPlTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f44b45d6abso30468115ad.0
        for <linux-coco@lists.linux.dev>; Mon, 24 Jun 2024 00:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719212866; x=1719817666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSaP9BELHJPncXgtj87yjJDAYd2o3bEQl0Jgoge/tXc=;
        b=SAUmfF/asaWA8RDfG0HbqZWI7ciOjTqkmQoexbJRv14hbKODxC3Ld7fUlJY8jtAvKX
         z1vOwulSIuS2OGOv3U3/R00UC4fXnFyw2xBfz3dFICCIfI3mfockrD4LjviNnbsdaExP
         dmi588ggwXQOd0YcfNHPOFpF415UfTMxE5CTuNJd9Ztpov27ticpdBOiAEwBV3ppclQb
         AZMmITtC7c1QqHVKrmLBD9p7+fIYIfE7mQYEjhFDr11As+ZsgZki35FH80WcFB4woRGR
         N7V/ub5YT4xrZNJ8MCvs6kchYEzPxQm10N4nz2hEu4GXn8h6PbIJoRGk6JDtD3KItgSz
         XVIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlMu2cbC3yIkYfEEiaG067cXLcIUj+VSuw1KxNWTx2iFNqYETXWtXWRdU6I/cYBvbimQsKdFm05xHkPoRyCvpXlV9V3lc7wmT1vA==
X-Gm-Message-State: AOJu0YytPO8rbmS17pAJ9bqREsgyBvNLSZ59lAMK6puQC+wee41gOT+y
	uj1hKabXmuvCeOPDSoG96cw4312P90zRe5nwcbLpkjotTmB05J6Z
X-Google-Smtp-Source: AGHT+IHn9Nj5BYs7dNR5EX+uaseXHvMuEo1uXR7vTbM98U6YZWH4x3owWhoYUg3Qi/ZZuGVx6QVpQg==
X-Received: by 2002:a17:902:ccce:b0:1fa:209e:b4f4 with SMTP id d9443c01a7336-1fa209eb5fdmr46453815ad.44.1719212866028;
        Mon, 24 Jun 2024 00:07:46 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbc479fsm55530025ad.291.2024.06.24.00.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 00:07:45 -0700 (PDT)
Date: Mon, 24 Jun 2024 07:07:38 +0000
From: Wei Liu <wei.liu@kernel.org>
To: mhklinux@outlook.com
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v2 1/1] Documentation: hyperv: Add overview of
 Confidential Computing VM support
Message-ID: <ZnkbOkWeIcSO-pmt@liuwe-devbox-debian-v2>
References: <20240618165059.10174-1-mhklinux@outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618165059.10174-1-mhklinux@outlook.com>

On Tue, Jun 18, 2024 at 09:50:59AM -0700, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
> 
> Add documentation topic for Confidential Computing (CoCo) VM support
> in Linux guests on Hyper-V.
> 
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>

Applied to hyperv-fixes, thanks.
