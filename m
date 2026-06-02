Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF1539EF14
	for <linux-coco@lists.linux.dev>; Tue,  2 Jun 2026 21:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780435604; cv=none; b=iJjHThzLW5NWoh1xLJfDELZBGCbbWVimiDJKU+CkKptkyOtSISpcJ/mLSj5ma4fLbdVBMLfs2Ens0SyqWO36GBtWpmsczJR7yh3Z7f8Vx7lt9bR74u88mnfHq21segQUPVlpHL6DqMNknkqEFJdwSzmTY2j+9J0x33fI7fnKKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780435604; c=relaxed/simple;
	bh=dXfphc9xwtT9J9Mx9nqk/TREcXFO8JL1ydyTeyM2RLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISEgOeAg5Rf4jQdDfCgYWqrLEm559Hyi0uqXaUNKVYIEWVc9dj+vwPRF4O2l0r6fGFp5nW0hpaf5LlSJJEVkhGXRVylbE8QnDn9uflr/RfX5/vWN0gxBXTJtccotF1X5iSvv0QpPbiadiLfkovDNSaLSghRADIvPxOW2eHxImBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LX08j4fc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LX08j4fc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso1761821f8f.2
        for <linux-coco@lists.linux.dev>; Tue, 02 Jun 2026 14:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780435601; x=1781040401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X+F9JE3lvSde2aXKa2nn0C2FzfJE3VdMHUXsv8Plio=;
        b=LX08j4fcjXWFfZTjYqpQRwpoX0NuGIDXHRqaYrkmcKq8rjVhCUaUoH+VjKWVxD9nWF
         40+F+Vcqo9IzZF65OVFG746xBjgguaLJj80bVK43KkBEtpPlMWiKiwefVhwB26YcvSUl
         j/n2WCBcE5Lug425UZ4cyP7XDKR+KL9AUnBnbh6Wk0kmrJ8l8218j6UMzXqBdRf7Jybb
         rYu31pPn8hf4q9YbObfF1j8vX7uHKErbht1WCF6z0bfmtKla5e+fC6IOC5cUOivWcNmH
         xjH7jUmpx7bgWTPOXyR79RFBwNRfTpHPJSmeGfExBfZDfbVnGzEvdRfSoMcOtJDGgpxw
         i2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780435601; x=1781040401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7X+F9JE3lvSde2aXKa2nn0C2FzfJE3VdMHUXsv8Plio=;
        b=b/GgIbJpRg+gr7eaxqLeVuiAEkmI7xXOevGAa9UhbkQhScbr8n8yhoMESavwljPner
         yHC1gy6SduigFsDJeksI8ACujWLiJ30HAATEVVHi570vmNPssatSt89JHRPyPXJR1KVE
         I8oN9Jwsqy2/RUABVMo1KSMTToo64KP2d/9Kpp80JuAID5p+UOawMohNruzTfSrDkhj4
         psTHGBBwazSMTqltwVfcY8SKH8zNGunq9avFGrSG/aeaVUK4qb2W2A4HL1oDrJRLOX3V
         b3tOZe1ExF2AfC3xk7YgY6fjljL1OFUVdU/8FEAmK7gHME9OgD0IUEIOj/jgLZ27u/Vq
         cUCg==
X-Forwarded-Encrypted: i=1; AFNElJ9FSD5i6mdWQMSLh22fIhpASn/ECnFiBKxhx4T4GqbOhyLuXIxYC9MIuK+GxPak04sK/cVqzezAmnld@lists.linux.dev
X-Gm-Message-State: AOJu0YzENrPf8y45Kg1wGrVqAHZZsKu3V9ZMxDocJwdEdNMKuDmqth7m
	yK6I+8mJNiEPV8egwt2wl9MrAFQohEmOlJnitAQwEusGTRzAW8NSOeNI
X-Gm-Gg: Acq92OGurkoBfLHlUPNQo6POr6cq+DMAKAHcVSCmTtJEmDCJBg9riCre+ARYtSHR04o
	nciQnfmx26YzlmKls8kDCWzY9kXlVWW5Yj/3IQjoUItSIYWFdVhwTZbFVgH7HhS7sB9Q4nqbduR
	efkf8P4KPD/NeZKOmZ8g6NCWuJ4k+w1sUK+/ADUdNeFrVIf1XdTd/gNkdXnMalFGd2Uo54GclsC
	tltfGC1itBD4IWPYj7HgGXCgFF6xp0J5zJbKpDPO7SSws1Q5SpBr8I7I7Td+GgMsY2nJWl5Wkyz
	I55/+jRpoBU9reyoROAJspcDypfVJ4pRCZB29hTV4rT7X5C37M2reIjWgyzKibKPvxWEazKVNHP
	kSTq3g/zNpbl81NwZxXQ5ZPveT6Shvgdf7yrxgusfY3LXmsJDapY+USK5mHSBUJB/i40Ger4I/c
	t4zfpHheDZfAb7BKGTl3gKKtjfw/IdWA==
X-Received: by 2002:a05:600c:c174:b0:490:b2a6:8c2b with SMTP id 5b1f17b1804b1-490b5eb82b2mr8862715e9.10.1780435601484;
        Tue, 02 Jun 2026 14:26:41 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490b614261bsm2203845e9.26.2026.06.02.14.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:26:41 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: devnull+ackerleytng.google.com@kernel.org
Cc: ackerleytng@google.com,
	aik@amd.com,
	akpm@linux-foundation.org,
	andrew.jones@linux.dev,
	aneesh.kumar@kernel.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	bhe@redhat.com,
	binbin.wu@linux.intel.com,
	bp@alien8.de,
	brauner@kernel.org,
	chao.p.peng@linux.intel.com,
	chrisl@kernel.org,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david@kernel.org,
	forkloop@google.com,
	hpa@zytor.com,
	ira.weiny@intel.com,
	jgg@ziepe.ca,
	jmattson@google.com,
	jthoughton@google.com,
	kas@kernel.org,
	kasong@tencent.com,
	kvm@vger.kernel.org,
	liam@infradead.org,
	linux-coco@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	mhiramat@kernel.org,
	michael.roth@amd.com,
	mingo@redhat.com,
	nphamcs@gmail.com,
	oupton@kernel.org,
	pankaj.gupta@amd.com,
	pbonzini@redhat.com,
	pratyush@kernel.org,
	qi.zheng@linux.dev,
	qperret@google.com,
	rick.p.edgecombe@intel.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	seanjc@google.com,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	shivankg@amd.com,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com,
	tglx@kernel.org,
	vannapurve@google.com,
	vbabka@kernel.org,
	weixugc@google.com,
	willy@infradead.org,
	wyihan@google.com,
	x86@kernel.org,
	yan.y.zhao@intel.com,
	youngjun.park@lge.com,
	yuanchu@google.com
Subject: Re: [PATCH v7 34/42] KVM: selftests: Test conversion with elevated page refcount
Date: Wed,  3 Jun 2026 00:26:30 +0300
Message-ID: <20260602212630.27012-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-gmem-inplace-conversion-v7-34-2f0fae496530@google.com>
References: <20260522-gmem-inplace-conversion-v7-34-2f0fae496530@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>:
> This test uses vmsplice to increment the refcount of a specific page

I recently submitted a patch, which makes vmsplice equivalent to
preadv2/pwritev2, and it was accepted to next.

For now it is just an experiment, it is possible it will be reverted.

https://lore.kernel.org/all/20260601-aufweichen-dissens-ausrechnen-0d9b84728113@brauner/

-- 
Askar Safin
