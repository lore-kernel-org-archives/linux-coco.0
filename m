Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E4F70820
	for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 18:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733855447; cv=none; b=AASBvrcoCEF3xVmSSSTxZ+fH1YCZNOlm7c8ITHO3XYZ3+KVCqP8BaK+at068EZZhQdQx8hxjNtBE3YBBAVC7nsMPirNiLCadrxE3u2lyRITfcQLDpBmSkH86cImHb3PflSTBmWWV63ecCN9+jO7c4x+sqZVjIU05oXYlS8j8ax8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733855447; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bQQqa/zIv9HL2c2EfDIVFyoVxmB8+L933pR+nyzusCwiaxPHIBbzol1Mo99rfdtggwFk8GvzGAfUMb8us6mZg95cTSrqgOzq/q4zl3yaC9S4Lwb98RXe7HaK077lwe1yiyVSGyjkleM/uF4i3oUcRgcnENdoK16TM8twXWJPQsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mt42icxv; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mt42icxv"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so7765507a12.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 10:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733855443; x=1734460243; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=mt42icxv3Y7twA4R/UHrl9o0pN6T9wbMuiHu4ha9+p8GjmIIilylbpYY6e+JKznqiR
         rlSlX9rdWeEJY4+rseJc2+1Ahw1giXt3L9jL67a9XkNm1CtT2LNrMiAZ2O4bO99vj8wM
         UDf6Qygoc8CoE8jTxlChuilHqO77UZUFSUoSSGT6WqMaNbFPrP71gtm7GbJen3vrX/FA
         4qvhczeweK62zhFAjTRq5Mxc6WZruOCGSkU/5ka+TYj3Q/aIqCrjNL5qoXLMuB+idDH7
         BMJD/41YdKP4B72dfSggagm0NpuavmY8tBzfgWVx9lZ2fNb3Uwmpbhkp+1Eepm46UMd2
         Ly8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733855443; x=1734460243;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=QYFl+YeEcnnHI55Xz/Z3KsEnBhXj/FDIdq94svEBXS7zJLBZC42I6BMbpbVckiTrSw
         3JlcP6ibr+ajoQdMHl7E4dzajt7na4iQgrdfpM8mMVe5btEnC7vmaf5MgdFLiji12UKi
         hg1HiMSCGtkjS0rmazoGu+FzZurFQr7eCJizz1G8RApTpGcoUVynDf3FtHcb1d1RSAeo
         LPP3UuSg0yL9m0UywBXEbuBmmJKmjWjNC+gJds2sPtFX8sykv99Qk6Hjcf3k5ALIwJlk
         TghACY0QK8CxibbdcXAvbDrFE5hO6VQDlubAlcNtjuidfFp4PdacDExJtOu+4j8pTwHG
         CvcQ==
X-Gm-Message-State: AOJu0YxRBKJpkxDHXsH9alB5wRFRWNwtYUHAK0DUWDDJrLbgso9RQ1J8
	S23LQiBr3LUigmgCTPkf4Gah3bdcxU/4uWh2PI/bw1r9zJuZEEb9AbVTZ37JuwdJzqFNK1nA0X1
	+Xq6Bh0iV6fY0kd/LRajm7s2TIqC9BKWWxpRJGhYK2Yh1FsAF
X-Gm-Gg: ASbGnctcwwCkZq+R2O0idShaDxGgw4v9yWGWcE2W79LkQtIn4Um7lPCKMvnnNh94BMv
	/RHG1gv2uDBGlIEbpIzUapOZiG7umhWhJFZLaWhk/i6fijgx8h79AcupoXa0PCD/jwBNrNA==
X-Google-Smtp-Source: AGHT+IFYwK4Bw8mshGZJ1RgNX0lqnLueO0DAmtmHu1AckYdN5+MEGjRzYLx3H8ZX138XAWi04ZDjmZOqo1BwNcoUj3g=
X-Received: by 2002:a05:6402:5386:b0:5d0:e73c:b7f2 with SMTP id
 4fb4d7f45d1cf-5d3be660913mr17940766a12.7.1733855443185; Tue, 10 Dec 2024
 10:30:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 Dec 2024 11:30:32 -0700
Message-ID: <CANLsYkxFRJhXUnqG9BqJ+q9q6qfMmSyENvk23WzOTPGhQY7tQQ@mail.gmail.com>
Subject: subscribe
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"


