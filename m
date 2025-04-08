Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D9722D786
	for <linux-coco@lists.linux.dev>; Tue,  8 Apr 2025 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134301; cv=none; b=cIUUFzV2zvD6i0J3uFnmhVvyuTd8D7EDKPA0DidfbNT+xOIsj1yku8cvB9vTRKHcXmWmRZan3y9NuTZ7ePIaBgdBGGSTPbA6dZyRuSh6EIeTYDuUtm6uqE/9K9UfcjsOE3UN9DfhLlDlhlRrx2hPKAxqgl6xSEFvliZnc02IRz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134301; c=relaxed/simple;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IA1+OHnKVC6HzjBACafuKFE61/fYOwU6whwZ+kBkz+Cf15NOxX/cD4C5qdfNNUJnV1BduVxcwRUrLrw01Qazkv6BEr28Qggxntd3fRquzq/n+iBn9qDpGgv+4CwvyLCMhHfBcDGZ1lWL2e2+Y05XGC2cvQt4OZPUliauTyCxoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=vXWCEYvB; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="vXWCEYvB"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id EB68347B61;
	Tue,  8 Apr 2025 19:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744134298;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:From;
	b=vXWCEYvBRK4GF84Q0tDpFKr17l/FNU5/cne74BP+3XAny1ucDapfkFXEKPWlIW20f
	 lPKkKmlvjyndyOUWqhy8bQNcptryYZNjnolstThrtwBz+rkjdnW903Rz5h4cFdabFX
	 FeJ4FOdtJnqxctYWENwNnrdDH/J3zJDUOawZyRisdynMIm8LUMUqCi3GH0QmpV83K3
	 2BiXJgENUEYqrkgO1vnyoTyRvBG/WFFCGPNZuy/KOIl2/T3RgjKMX4rVMYSbzRUPQr
	 /qBsO5rl2sdc1AmyI4LeCTQaNLr5TibUOPF7oSFUPta/RiC9JTjMne7TB2TokQ1xoE
	 Mfyc8jrMitJhg==
Date: Tue, 8 Apr 2025 19:44:56 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call April 9th, 2025
Message-ID: <Z_VgmBYq96ShGdhr@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Here is the usual call for agenda items for the this weeks SVSM
development call.  Please send me any agenda items you have in mind or
raise them in the meeting.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
