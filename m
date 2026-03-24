Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946213AC0C9
	for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 06:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332942; cv=none; b=QLh+KJ7xT55QL9XXeXQl6KhKHZ434EGGg/DhxkFuk2CIZTOfduffr54wRyPGagkTsvwZU1XsPeRYEYMdI1mlwfClYYWZx465ZpepFcNXUDj8nfjPDF52547mXQIuclfUy6QvO7iNeB4pC5cgkPPLqrqW9va+BC6Mpmqz5Nws8u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332942; c=relaxed/simple;
	bh=yu3nC6vhpzZez3hZu5WSDBz9l+V7URi8BT2ABBFXuP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGO34SKRTkZRam7/qXqJV/mfBWCfG7lY7EmPKlZDUpHm5VmgyucZr8O193WMBxX/u4MUhZINyBdQerVwA9vl8G4UvFTNXqPTA+4jsAOJiI4ktGZRP5t6nEnME4kwJe+LuNDG79cpSqMU5tG5AvKriBr9OwdyfZVKYkwh+zJG7NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4nWCo/d; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4nWCo/d"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso29395885e9.1
        for <linux-coco@lists.linux.dev>; Mon, 23 Mar 2026 23:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774332939; x=1774937739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=B4nWCo/dlWQ3IgGVxY1VLLCI/TnABfFaycdKFMUVnSlRnqQ6PFDJU6UGoHbpytuXfs
         WdSZwS75Wz9/dLtVClcUq8rK0mR+TQxlPly4nj2Ryx5QO38mBN4wbVhNXMykrqGDSzIA
         /oR3gcObVguQ7EIezi+pNv4Kidw6Dr1PwUOeFl/6TFL2OLRdqE/q60dzS2vOfxpLkS3n
         2n6Y8bH757ZBrPbQ+Q8veoHj21TVYz1arNr7mjwvDuXUsyl+vfdu9Hkx4karyNqJJqZ5
         Xo/vuO8dGdshl1i8TA2vaUEnmfr6PMPqD+rftuH5iVy3qyyb9n0Hy0aPpJy3MejpVSVW
         Y9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774332939; x=1774937739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=GgaUqreHJ0w861TvafIbOL867VaG8lviK5PD2GUZHLcDNNmlonRR45NC2pgNYP9pW+
         xidBGZW+8LUJyLqHNrz9QYFj6AShBxop1Y0YAgmZZonRn07nu9dtSwQ2mqDr3aSLPfDM
         OyhuAh5QpcxvwdtMa2d0pIV/IMse0gHZ5D68YRntb6hXX+m6MkFGpKEVvib6jgOxL1/x
         U04sAV6TWeZYGiI2VgTJtbrV6yWkijwfgIRGDs+k9ZDuoT3PcCZlbV0yl5VOGknQLCTD
         p8YXICAaWwpWsl9SJqL5rFKl3XmuxrknB/pRrprsHZimY4XhuQPnCoKuv5MY755oFCc0
         qrxg==
X-Forwarded-Encrypted: i=1; AJvYcCWMspWI2AIQrE6QDTsOuXWd7ETwZzR+TUx3TfaxK1lfEonHQrjzEPY9vMLue+tZYvY/vc6IdsvgiDGT@lists.linux.dev
X-Gm-Message-State: AOJu0YwjnovCgMKmyyHgaVyF6Ya7FoI5gpyJZymTTlCWqAlGbfdMLJAA
	bJGx4ca3y9xUbRyG7SZqoDzjXSvxTZPNYIUdL8Lo+q4l+A14DLmMMrnV
X-Gm-Gg: ATEYQzyzM6xNTxXpG/njxXWPWzTYzSiBcZvCR6fuV2EV/w56Z3ESLocT/9wbg9IL0DC
	A67WebC8nfBw44khptdtVTlbcT/iHY9LqZg8SchXcax+ZyMjfj/Dazwk+yxGk8Xww4hQO8teBb9
	SEMBUx58mcq2GnrgZeJufdd0/mt/7KJudAMiJColNDSQvxIKT/UrmuYmRvs6yt+W3ovXVz+REk3
	BKBpvNEa+e2QOREdIOs/T0kAutscQmjQBGF5hGe6ve8jN1JWjKEnhl9OcJF+z40La0x18jUbEZ5
	yxPuYsqfNA7bFfkPxVt7GIiyHjMUmNfbPmafimwPMBnKqUxrInI9xdf65VXUXaD/41LhMsM/sjT
	cTqV6isQBtKFr77WlqNu+8sJT7vhuOH9Il/yJgWSPByxzDowrhfgWzlVjTqqsqfRvYU1ljs20cR
	ZFTB4NpNZd8WlI3LzUBio=
X-Received: by 2002:a05:600c:8b25:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-486fee0d8cdmr212926635e9.21.1774332938609;
        Mon, 23 Mar 2026 23:15:38 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48710fe6f86sm13091615e9.6.2026.03.23.23.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 23:15:36 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: babu.moger@amd.com
Cc: kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 00/16] fs,x86/resctrl: Add kernel-mode (e.g., PLZA) support to the resctrl subsystem
Date: Tue, 24 Mar 2026 09:15:31 +0300
Message-ID: <20260324061531.3221932-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773347820.git.babu.moger@amd.com>
References: <cover.1773347820.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please, remove me from CC list in future versions of this patchset

-- 
Askar Safin
