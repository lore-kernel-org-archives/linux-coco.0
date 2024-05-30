Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039966F2E4
	for <linux-coco@lists.linux.dev>; Thu, 30 May 2024 08:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058837; cv=none; b=RXWRTw+Gx7hP/pRoQg0vR0zMmBrCYlRXMQ8W2NWewvHYsZN56FPtZOHUMz3ZtJ9mQcJTGVSLAmLu7Lcg0ULd534ibqNB8yURWR/rAgO7XJL12FuooFNiNKxWL+Op9JJWpByZO0OifAkrV1i17Md6vrce7ZszDzHmFa/FNjVj20g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058837; c=relaxed/simple;
	bh=XvOvLXRyULIqUgz/p6/YzkVR0eOhDj4r285TKY15LeQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlrM5Pll3ijfT+J0K6dFAB+scUawCwr8SZOlPGaKiPUe287QqYYll37twX0v0M6c6GuoXal8TiWo/KecZ7OWUFRjBOgrjojIEOJUpU6Ysl73VcQN9U/jBwihM7/cuUjvxj7rl0FNjRWIWYuNwyWOWJBg+559RjN+XWf3bFb1j90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=GR9fofTN; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="GR9fofTN"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 14C861C680A;
	Thu, 30 May 2024 10:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1717058828;
	bh=XvOvLXRyULIqUgz/p6/YzkVR0eOhDj4r285TKY15LeQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=GR9fofTNui80n54x/gL3OlGW/VAeOX1AZaBP0DdYxyns73VZyMfo46H00IDHs9rAS
	 dnSREJR5eZjz2JNk0PeN0C3d0uucipgKm9kh4qCGbx+TUMuLFzhUNx7KjaA5WgtrQD
	 F+HsU+28EZgcG2FlDniYSGGgr9DSt4oB6RvQZMhQwboGpS8fCN8BjbMCUUkBPFsAlK
	 8lzHPWeKx4pwGfvsJUXvmQ/HVwnv9d2fteRwin8ciu47uDJod9ZNksj7KiSePO9K78
	 wCvdo35X9IlyTSCX090tuueq6ViqH1yGvcQ13hFEzL/Z1QG1+nxD+zxtf1ciPeJbEO
	 qy8HT7WaZ7dHQ==
Date: Thu, 30 May 2024 10:47:06 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call May 29th, 2024
Message-ID: <Zlg9CntuwhSORLHJ@8bytes.org>
References: <ZlY5A4N4S88FeFDQ@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZlY5A4N4S88FeFDQ@8bytes.org>

On Tue, May 28, 2024 at 10:05:23PM +0200, Jörg Rödel wrote:
> 	https://github.com/coconut-svsm/governance

PR with minutes of yesterdays meeting is now posted here:

	https://github.com/coconut-svsm/governance/pull/15

Regards,

	Joerg
