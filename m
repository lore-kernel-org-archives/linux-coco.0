Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AF92FBE1D
	for <linux-coco@lists.linux.dev>; Thu,  4 Dec 2025 05:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764827830; cv=none; b=ljNKdpqvlQIreQVDja/DkGfDcaqMuNbknqxT4iLOHopUfo+tkOI7iS3CH99Ww5e55oKqnw52F5hDxeZii6sBdK+5MFOshXn5Zh4WEcGi4GSg+/XkENlbDLafB2snLuRNjLmTwFqoIJXgaYXRE5L308kD3BZL23kJOqdZoJvUDgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764827830; c=relaxed/simple;
	bh=nt/ITWcINz7SB0UIgRGAVhhw18WKkVjfP5T/j7IxVsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulcszR838KX7jwXQXU7UGThCJJd3CWNm7GJ5OUMqfaH62XvnspyIz7K/kzl3jTMQ4iSlB82dUfHh14cIntoGw+BsmLoeIRGyiHQB/LFAbHtAWcjXVnyUKpd9G8FvSmA98ceoCESENRyDOYSCzO7jVQMcVMdet6Q+QrseTA+m760=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3x5IBsC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3x5IBsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8053C113D0;
	Thu,  4 Dec 2025 05:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764827829;
	bh=nt/ITWcINz7SB0UIgRGAVhhw18WKkVjfP5T/j7IxVsg=;
	h=From:To:Cc:Subject:Date:From;
	b=g3x5IBsC0WEvSyzlU+sbRqtsE/bgJz7W0tfKTE2FI9wcazryUaaCwZz+7XfcNu5qt
	 UDtL7jiuhZKSIpEWeN0uQTPn99iJ2ioInWEc4zH8a6wxCWeuQBhTQuDA34Zy/77sth
	 jn9zOELUzGKf/fLLssHjn9XTXF8I2Dqafaj67CxHRsKPK8GtBl23ImSSMxlnxLDgOn
	 6rn4CCBwPHiTCzWGLrswM44wfN5ozM+P/uye64S2Hf9qdSqmqaDMEGRoyCTzxze59w
	 mWfI2/PHMrpdX4+ZO0K+/5nBb8jzV7i11rOpyHZJEHN4GJDKc3l+P0AWOS0gHApaV0
	 QvUUyG+iSUwaQ==
From: Eric Biggers <ebiggers@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>,
	linux-coco@lists.linux.dev
Cc: Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] coco/guest: Remove unneeded selection of CRYPTO
Date: Wed,  3 Dec 2025 21:55:12 -0800
Message-ID: <20251204055512.494013-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All that's needed here is CRYPTO_HASH_INFO.  It used to be the case that
CRYPTO_HASH_INFO was visible only when CRYPTO, but that was fixed by
commit aacb37f597d0 ("lib/crypto: hash_info: Move hash_info.c into
lib/crypto/").  Now CRYPTO_HASH_INFO can be selected directly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/virt/coco/guest/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/virt/coco/guest/Kconfig b/drivers/virt/coco/guest/Kconfig
index 3d5e1d05bf34..da570dc4bd48 100644
--- a/drivers/virt/coco/guest/Kconfig
+++ b/drivers/virt/coco/guest/Kconfig
@@ -11,7 +11,6 @@ config TSM_REPORTS
 	tristate
 
 config TSM_MEASUREMENTS
 	select TSM_GUEST
 	select CRYPTO_HASH_INFO
-	select CRYPTO
 	bool

base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
-- 
2.52.0

